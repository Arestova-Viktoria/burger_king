
import 'package:burger_king/domain/bloc/catalog_bloc.dart';
import 'package:burger_king/internal/dependencies/product_repository_module.dart';

class ProductModule{
  static CatalogBloc catalogBloc(){
    return CatalogBloc(ProductRepositoryModule.productDataRepository);
  }
}