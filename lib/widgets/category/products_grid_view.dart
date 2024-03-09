import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/product_model.dart';
import '../product/product_card.dart';

class ProductsGridVIew extends StatelessWidget {
  const ProductsGridVIew({
    super.key,
    required this.categoryProduct,
  });

  final List<ProductModel> categoryProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.0.h),
      child: GridView.builder(
        itemCount: categoryProduct.length,
        itemBuilder: (context, index) =>
            ProductCard(product: categoryProduct[index]),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190.w,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 20.w,
          childAspectRatio: 6 / 9,
        ),
      ),
    );
  }
}
