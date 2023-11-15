

import 'package:burger_king/domain/bloc/categories_bloc.dart';
import 'package:burger_king/internal/dependencies/category_repository_module.dart';

class CategoryModule{
  static CategoriesBloc categoriesBloc(){
    return CategoriesBloc(CategoryRepositoryModule.categoryDataRepository);
  }
}