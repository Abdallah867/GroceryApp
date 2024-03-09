import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isLogoutButton;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLogoutButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        backgroundColor:
            !isLogoutButton ? kSecondaryColor : const Color(0xFFF2F3F2),
        minimumSize: const Size(364, 67),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: !isLogoutButton ? Colors.white : kSecondaryColor,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
