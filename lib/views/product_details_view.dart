import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/product_details/counter_widget.dart';
import '../widgets/product_details/expansion_widget.dart';
import '../widgets/product_details/image_widget.dart';
import '../widgets/product_details/product_name.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  final String imageKey;
  const ProductDetailsView(
      {super.key, required this.product, required this.imageKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 317.0.h,
            flexibleSpace: FlexibleSpaceBar(
              background: ImageWidget(
                image: product.productImage,
                imageKey: imageKey,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: Column(
                children: [
                  SizedBox(height: 47.h),
                  ProductNameWidget(product: product),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CounterWidget(
                        counter: product is CartModel
                            ? (product as CartModel).numberOfProducts
                            : 1,
                        productId: product.productId,
                        isInCartScreen: true,
                      ),
                      Text(
                        "4.99\$",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  ExpansionWidget(
                    productDetail: product.productDetail,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: 20.0.h,
          right: 25.0.w,
          left: 25.0.w,
          top: 20.0.w,
        ),
        child: BlocConsumer<CartCubit, CartState>(listener: (context, state) {
          if (state is CartAdding) {
            showSnackBar(context, "Product added to cart succesfully");
            Navigator.pop(context);
          }
          if (state is CartAddedBefore) {
            showSnackBar(context, "Product added before");
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          return CustomButton(
            text: "Add to cart",
            onPressed: () {
              BlocProvider.of<CartCubit>(context).addToCart(product.productId);
            },
          );
        }),
      ),
    );
  }
}
