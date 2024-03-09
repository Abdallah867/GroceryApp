import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/product_cubit/product_cubit.dart';
import '../../cubits/product_cubit/product_state.dart';
import 'product_list_view.dart';
import 'shimmer_loading_widget.dart';

class ProductsListViewBlocBuilder extends StatelessWidget {
  const ProductsListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const ShimmerLoadingWidget();
        } else if (state is ExclusiveProductSuccess) {
          return ProductsListView(
            products: state.exclusiveProducts,
          );
        } else {
          return const Text('OOPS, There was an error');
        }
      },
    );
  }
}
