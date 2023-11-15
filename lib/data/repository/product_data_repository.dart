
import 'package:burger_king/data/products_data.dart';
import 'package:burger_king/domain/model/product.dart';
import 'package:burger_king/domain/repository/product_repository.dart';

class ProductDataRepository extends ProductRepository{

  final ProductsData _productsData;

  ProductDataRepository(
      this._productsData
      );

  @override
  List<Product> getListProduct({required int categoryId,}){

    List<Map<String,dynamic>> maps = _productsData.listProducts;
    //записываем данные из списка maps в список объектов product (в перем. products)
    final productsFull = maps
        .map((product) => Product.fromMap(product))
        .toList();
    //
    final List<Product> products = [];
    for (Product product in productsFull){
      if (product.categoryId == categoryId){
        products.add(product);
      }
    }

    return products;
  }


}