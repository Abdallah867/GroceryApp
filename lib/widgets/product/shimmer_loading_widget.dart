import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: const Color(0xffC0C0C0),
        highlightColor: const Color(0xffD3D3E7),
        child: SizedBox(
          height: 250.h,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: ListView.separated(
              separatorBuilder: (context, inte) => SizedBox(
                width: 24.w,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                height: 248.51.h,
                width: 173.32.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
              itemCount: 5,
            ),
          ),
        ),
      ),
    );
  }
}
