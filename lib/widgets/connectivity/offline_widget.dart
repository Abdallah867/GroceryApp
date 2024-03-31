import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          SvgPicture.asset(
            "assets/images/No connection-bro.svg",
            width: 300.w,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'No Internet Connexion :( ',
            style: TextStyle(
              fontSize: 26.sp,
            ),
          ),
          Text(
            'Please, check your internet connexion',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
