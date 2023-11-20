import 'package:burger_king/domain/model/category.dart';
import 'package:burger_king/presentation/categories/categories_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesListView extends StatefulWidget {

  final List<Category> _categoriesList;

  const CategoriesListView(this._categoriesList, {super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  Selection selection = Selection();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => selection,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...widget._categoriesList.map((category) => CategoriesListItem(category))
        ],
      ),
    );
  }

}

class Selection extends ChangeNotifier{
  int selectedIndex = 0;

  void updateState(int id){
    selectedIndex = id;
    notifyListeners();
  }
}