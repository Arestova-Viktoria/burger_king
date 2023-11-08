
import 'package:burger_king/domain/model/product.dart';

abstract class ProductRepository{
  Future<List<Product>> getListProduct();
}