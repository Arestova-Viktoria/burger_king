import 'package:burger_king/domain/model/category.dart';
import 'package:burger_king/presentation/categories_textbutton.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {

  final List<Category> _categoriesList;
  final int selectedIndex;

  const CategoriesListView(this._categoriesList, this.selectedIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ..._categoriesList.map((category) => CategoriesTextButton(category,selectedIndex))
      ],
    );
  }
}
