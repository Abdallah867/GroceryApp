import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/cubits/product_cubit/product_cubit.dart';
import 'package:grocery_app/custom_app_bar.dart';
import 'package:grocery_app/widgets/search/custom_search_bar.dart';
import '../cubits/product_cubit/product_state.dart';
import '../widgets/category/products_grid_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        body: Column(
          children: [
            customAppBar('Search a Product'),
            SizedBox(
              height: 20.h,
            ),
            CustomSearchBar(onChanged: (value, context) {
              BlocProvider.of<ProductCubit>(context).getSearchProducts(value);
            }),
            const Expanded(
              child: ProductsGridBlocBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsGridBlocBuilder extends StatelessWidget {
  const ProductsGridBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Text('');
        } else {
          if (state is FoundProductSuccess) {
            if (state.foundProducts.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No product found :('),
              );
            } else {
              return ProductsGridVIew(categoryProduct: state.foundProducts);
            }
          } else if (state is ProductFailure) {
            return Text('$state.errMessage');
          } else {
            return const Text('Oops there was an error');
          }
        }
      },
    );
  }
}
