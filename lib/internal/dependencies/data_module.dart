
import 'package:burger_king/data/categories_data.dart';
import 'package:burger_king/data/products_data.dart';

class DataModule{
  static ProductsData? _productsData;
  static CategoriesData? _categoriesData;

  static ProductsData productsData(){
    if (_productsData == null) {
      _productsData = ProductsData();
    }
    return _productsData!;
  }

  static CategoriesData categoriesData(){
    if (_categoriesData == null) {
      _categoriesData = CategoriesData();
    }
    return _categoriesData!;
  }

}