import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/checking_connexion/checking_connexion_cubit.dart';
import '../../helper/show_snack_bar.dart';
import '../connectivity/home_checker_connexion.dart';
import '../custom_button.dart';
import '../custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showSnackBar(context, "Logged in successfully");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => CheckingConnexionCubit(),
                child: const HomeCheckerConnexion(),
              ),
            ),
          );
        }
        if (state is SignInFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is SignInLoading ? true : false,
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CustomTextFormField(
                  text: 'Email',
                  onChanged: (email) {
                    authCubit.email = email;
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomTextFormField(
                  text: 'Password',
                  isPassword: true,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password ?"),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                state is SignInLoading
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0.h),
                        child: const CircularProgressIndicator(
                          color: kSecondaryColor,
                        ),
                      )
                    : CustomButton(
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            await authCubit.loginUser();
                          }
                        },
                        text: "Login",
                        // onPressed: ,
                      ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
