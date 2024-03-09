import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:grocery_app/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final Function(String)? onChanged;
  final bool isPassword;
  const CustomTextFormField({
    super.key,
    required this.text,
    this.onChanged,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: text,
              theme: Theme.of(context).textTheme.titleSmall,
            ),
            TextFormField(
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Field required";
                } else {
                  return null;
                }
              },
              cursorColor: kSecondaryColor,
              onChanged: onChanged,
              obscureText: isPassword == true
                  ? BlocProvider.of<AuthCubit>(context).isPasswordVisible
                  : false,
              decoration: InputDecoration(
                suffixIcon: !isPassword ? null : showPassword(context),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(226, 226, 226, 0.988),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFC4C4C4),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  IconButton showPassword(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<AuthCubit>(context).changePasswordVisibility();
      },
      icon: BlocProvider.of<AuthCubit>(context).isPasswordVisible
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }
}

// class PasswordIcon extends StatelessWidget {
//   const PasswordIcon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthCubit, AuthState>(
//       builder: (context, state) {
//         return IconButton(
//           onPressed: () {
//             BlocProvider.of<AuthCubit>(context).changePasswordVisibility();
//           },
//           icon: BlocProvider.of<AuthCubit>(context).isPasswordVisible
//               ? const Icon(Icons.visibility)
//               : const Icon(Icons.visibility_off),
//         );
//       },
//     );
//   }
// }
