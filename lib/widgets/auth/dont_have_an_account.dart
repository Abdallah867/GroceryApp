import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../views/sign_up_view.dart';
import '../custom_text.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: "Don't have an account? ",
          theme: Theme.of(context).textTheme.titleMedium,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SignUpView()),
            );
          },
          child: const Text(
            "Signup",
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
