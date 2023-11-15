import 'package:burger_king/domain/bloc/categories_bloc.dart';
import 'package:burger_king/domain/model/category.dart';
import 'package:burger_king/internal/dependencies/category_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final CategoriesBloc _categoriesBloc = CategoryModule.categoriesBloc();

  @override
  void initState() {
    super.initState();
    _categoriesBloc.add(RefreshCategoriesEvent());
  }

  @override
  void dispose() {
    _categoriesBloc.close();
    super.dispose();
  }

  //List categoriesList = ["Популярные блюда","Комбо","Креветки","Гриль","Бургеры"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener <CategoriesBloc, CategoriesState>(
      bloc: _categoriesBloc,
      listener: (context,state){
        if (state is ErrorCategoriesState) {
          print("Ошибка");
        }
      },
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        bloc: _categoriesBloc,
        builder: (context,state){
          if (state is ReadyCategoriesState) {
            return _getListView(state.listCategories, selectedIndex);
          }
          else{
            return const Text("Загрузка");
          }
        },
      ),
    );
      //_getListView(categoriesList, selectedIndex);
  }

  Widget _getListView(categoriesList, selectedIndex) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ...categoriesList.map((category) => _getTextButton(category,selectedIndex))
      ],
    );
  }

  Widget _getTextButton(Category category,selectedIndex){
    return TextButton(
        onPressed: () {

        },
        style: TextButton.styleFrom(
          backgroundColor: selectedIndex == category.id ? const Color.fromRGBO(228, 200, 64,1.00) : Colors.transparent,
        ),
        child: Text(category.name,
          style: TextStyle(
            color: selectedIndex == category.id ? Colors.black : Colors.white30,
            fontWeight: selectedIndex == category.id ? FontWeight.w600 : FontWeight.normal,
            fontSize: 15,
          ),
        )
    );
  }
}