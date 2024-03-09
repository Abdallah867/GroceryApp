import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/category_model.dart';

import '../../constants.dart';
import '../../helper/service_locator.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());
  List<CategoryModel> categoriesList = [];
  List<String> hexColors = [
    '53B175',
    'F8A44C',
    'FDE598',
    'B7DFF5',
    'F7A593',
    'D3B0E0'
  ];

  getCategories() {
    List<Color> colors =
        hexColors.map((hex) => Color(int.parse('0xFF$hex'))).toList();

    final databases = getIt.get<Databases>();

    Future categories = databases.listDocuments(
      databaseId: kDatabaseId,
      collectionId: kCategoryCollectionId,
    );

    categories.then((response) {
      int index = 0;
      for (var document in response.documents) {
        var category = CategoryModel.fromJson(document.data, colors[index]);
        categoriesList.add(category);
        index++;
      }
      emit(CategorySuccess());
    }).catchError((error) {
      print(error.response);
      emit(CategoryFailure(errMessage: error.toString()));
    });
  }
}
