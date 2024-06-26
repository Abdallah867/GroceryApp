import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../models/product_model.dart';

class FavouriteItem extends StatelessWidget {
  final ProductModel product;
  const FavouriteItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 30.h),
        leading: SizedBox(
          width: 60.h,
          child: Image.network(product.productImage),
        ),
        title: Text(product.productName),
        subtitle: Text(
          product.productUnit,
          style: const TextStyle(
            fontSize: 14,
            color: kGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${product.productPrice}\$",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

            // IconButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => MultiBlocProvider(
            //           providers: [
            //             // BlocProvider(
            //             //   create: (context) => CartCubit(),
            //             // ),
            //             BlocProvider(
            //               create: (context) => CounterCubit(),
            //             ),
            //           ],
            //           child: ProductDetailsView(
            //             product: product,
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            //   icon: const Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     size: 18,
            //   ),
            // ),
