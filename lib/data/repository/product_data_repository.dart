
import 'package:burger_king/data/products_data.dart';
import 'package:burger_king/domain/model/product.dart';
import 'package:burger_king/domain/repository/product_repository.dart';

class ProductDataRepository extends ProductRepository{

  ProductsData _productsData;

  ProductDataRepository(
      this._productsData
      );

  @override
  List<Product> getListProduct(){

    List<Map<String,dynamic>> maps = _productsData.values;
    //записываем данные из map в объекты product (в перем. products)
    final products = maps
        .map((product) => Product.fromMap(product))
        .toList();

    return products;
  }

}