import 'package:burger_king/domain/model/category.dart';
import 'package:burger_king/presentation/categories/categories_button.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {

  final List<Category> _categoriesList;

  const CategoriesListView(this._categoriesList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ..._categoriesList.map((category) => CategoriesTextButton(category))
      ],
    );
  }
}
