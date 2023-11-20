
import 'package:burger_king/data/categories_data.dart';
import 'package:burger_king/domain/model/category.dart';
import 'package:burger_king/domain/repository/category_repository.dart';

class CategoryDataRepository extends CategoryRepository{

  final CategoriesData _categoriesData;

  CategoryDataRepository(
      this._categoriesData
      );

  @override
  List<Category> getListCategory() {
    List<Map<String,dynamic>> maps = _categoriesData.listCategories;
    //записываем данные из maps в список объектов category (в перем. categories)
    final categories = maps
        .map((category) => Category.fromMap(category))
        .toList();

    return categories;
  }

}