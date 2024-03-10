import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/cubits/product_cubit/product_cubit.dart';
import '../widgets/custom_text.dart';
import '../widgets/product/filtered_product_widget.dart';
import '../widgets/search/search_input_navigation.dart';

class ShopView extends StatelessWidget {
  const ShopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 100.h,
          // expandedHeight: 100.h,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                height: 40.h,
              ),
              CustomText(
                text: "Grocery App",
                theme:
                    TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(child: SearchInputNavigation()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Image.asset(
            'assets/images/banner.png',
            height: 115.h,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30.h,
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => ProductCubit(),
            child: const FilteredProductWidget(
              filter: "isExclusive",
              name: "Exclusive Offer",
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 40.h,
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => ProductCubit(),
            child: const FilteredProductWidget(
              filter: "isBestSelling",
              name: "Best Selling Offer",
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
      ],
    );
  }
}
