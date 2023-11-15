
import 'package:burger_king/data/products_data.dart';
import 'package:burger_king/domain/model/product.dart';
import 'package:burger_king/domain/repository/product_repository.dart';

class ProductDataRepository extends ProductRepository{

  final ProductsData _productsData;

  ProductDataRepository(
      this._productsData
      );

  @override
  List<Product> getListProduct(){

    List<Map<String,dynamic>> maps = _productsData.listProducts;
    //записываем данные из списка maps в список объектов product (в перем. products)
    final products = maps
        .map((product) => Product.fromMap(product))
        .toList();

    return products;
  }


}