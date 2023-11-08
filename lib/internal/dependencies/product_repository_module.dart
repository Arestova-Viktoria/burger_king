
import 'package:burger_king/data/repository/product_data_repository.dart';
import 'package:burger_king/internal/dependencies/db_module.dart';

class ProductRepositoryModule{
  static final productDataRepository =
      ProductDataRepository(DbModule.ormProduct());
}