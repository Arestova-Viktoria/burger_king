

import 'package:burger_king/data/db/orm/orm_product.dart';
import 'package:burger_king/domain/model/product.dart';
import 'package:burger_king/domain/repository/product_repository.dart';

class ProductDataRepository extends ProductRepository{
  OrmProduct _ormProduct;

  ProductDataRepository(
      this._ormProduct
      );

  @override
  Future<List<Product>> getListProduct() async {

    List<Product> products = await _ormProduct.getListProduct();

    return products;
  }

}