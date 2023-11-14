
import 'package:burger_king/data/repository/product_data_repository.dart';
import 'package:burger_king/internal/dependencies/data_module.dart';

class ProductRepositoryModule{
  static final productDataRepository =
      ProductDataRepository(DataModule.productsData());
}