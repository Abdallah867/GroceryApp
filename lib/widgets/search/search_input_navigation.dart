import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/views/search_view.dart';
import 'package:grocery_app/widgets/search/custom_search_bar.dart';

import '../../cubits/product_cubit/product_cubit.dart';

class SearchInputNavigation extends StatelessWidget {
  const SearchInputNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ProductCubit(),
              child: const SearchView(),
            ),
          ),
        );
      },
      child: const AbsorbPointer(
        absorbing: true,
        child: CustomSearchBar(
          onChanged: null,
        ),
      ),
    );
  }
}
