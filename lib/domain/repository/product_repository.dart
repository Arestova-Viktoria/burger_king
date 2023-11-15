
import 'package:burger_king/domain/model/product.dart';

abstract class ProductRepository{
  List<Product> getListProduct({
    required int categoryId,
  });
}