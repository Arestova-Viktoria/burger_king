// преобразование одной модели в другую и наоборот

import 'package:burger_king/data/db/model/db_product.dart';
import 'package:burger_king/domain/model/product.dart';

class ProductMapper {
  static Product fromDb(DbProduct dbProduct){
    return Product(
        dbProduct.id,
        dbProduct.title,
        dbProduct.image,
        dbProduct.price);
  }

  static DbProduct toDb(Product product){
    return DbProduct(
        product.id,
        product.title,
        product.image,
        product.price);
  }
}