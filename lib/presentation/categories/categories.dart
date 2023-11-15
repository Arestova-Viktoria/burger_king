import 'package:burger_king/domain/bloc/categories_bloc.dart';
import 'package:burger_king/internal/dependencies/category_module.dart';
import 'package:burger_king/presentation/categories/categories_list.dart';
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
            return CategoriesListView(state.listCategories);
          }
          else{
            return const Text("Загрузка");
          }
        },
      ),
    );
  }

}