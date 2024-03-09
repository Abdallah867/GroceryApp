import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/custom_app_bar.dart';
import 'package:grocery_app/widgets/search/search_input_navigation.dart';
import '../widgets/category/category_grid_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Categories"),
      body: Column(
        children: [
          const SearchInputNavigation(),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h),
              child: const CategoriesGridView(),
            ),
          ),
        ],
      ),
    );
  }
}
