
import 'package:burger_king/domain/bloc/catalog_bloc.dart';
import 'package:burger_king/domain/model/category.dart';
import 'package:burger_king/presentation/categories/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class CategoriesListItem extends StatefulWidget {

  final Category _category;

  const CategoriesListItem(this._category, {super.key});

  @override
  State<CategoriesListItem> createState() => _CategoriesListItemState();
}

class _CategoriesListItemState extends State<CategoriesListItem> {

  @override
  Widget build(BuildContext context) {
    int selectedIndex = Provider.of<Selection>(context).selectedIndex;

    return TextButton(
        onPressed: () {
          // для обновления каталога
          BlocProvider.of<CatalogBloc>(context).add(FilterCatalogEvent(categoryIndex: widget._category.id));
          // для обновления listview с категориями
          Provider.of<Selection>(context,listen: false).updateState(widget._category.id);
        },
        style: TextButton.styleFrom(
          backgroundColor: selectedIndex == widget._category.id ? const Color.fromRGBO(228, 200, 64,1.00) : Colors.transparent,
        ),
        child: Text(widget._category.name,
          style: TextStyle(
            color: selectedIndex == widget._category.id ? Colors.black : Colors.white30,
            fontWeight: selectedIndex == widget._category.id ? FontWeight.w600 : FontWeight.normal,
            fontSize: 15,
          ),
        ),
    );
  }
}

