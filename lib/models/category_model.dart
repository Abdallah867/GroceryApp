import 'package:flutter/material.dart';

class CategoryModel {
  final String categoryName;
  final String imageUrl;
  final Color categoryColor;

  CategoryModel({
    required this.categoryName,
    required this.imageUrl,
    required this.categoryColor,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json, Color color) {
    return CategoryModel(
      categoryName: json["CategoryName"],
      imageUrl: json['CategoryImage'],
      categoryColor: color,
    );
  }
}
