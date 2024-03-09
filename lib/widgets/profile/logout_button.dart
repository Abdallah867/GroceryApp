import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../helper/show_snack_bar.dart';
import '../../loading_widget.dart';
import '../../views/sign_up_view.dart';
import '../custom_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutFailure) {
          showSnackBar(context, "$state.errMessage");
        }
        if (state is LogoutSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const SignUpView()),
              ));
        }
      },
      builder: (context, state) {
        return state is LogoutLoading
            ? const LoadingWidget()
            : CustomButton(
                text: 'Logout',
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logoutUser();
                },
                isLogoutButton: true,
              );
      },
    );
  }
}
