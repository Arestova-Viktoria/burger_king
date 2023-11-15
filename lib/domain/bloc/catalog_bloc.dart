import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:burger_king/domain/repository/product_repository.dart';

import '../model/product.dart';


class CatalogBloc extends Bloc<CatalogEvent,CatalogState>{

  final ProductRepository _productRepository;

  CatalogBloc(
      this._productRepository,
      ) : super(LoadingCatalogState());


  CatalogState get initialState => LoadingCatalogState();

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is RefreshCatalogEvent) {
      yield await _mapRefreshToState(event);
    }
  }

  Future<CatalogState> _mapRefreshToState(RefreshCatalogEvent event) async {
    try {
      final List<Product> listProducts = _productRepository.getListProduct();
      // выбираем продукты определенной категории
      final List<Product> productsCategory = [];
      for (Product product in listProducts){
        if (product.categoryId == event.categoryIndex){
          productsCategory.add(product);
        }
      }
      return ReadyCatalogState(productsCategory);
    } catch(e) {
      return ErrorCatalogState(e);
    }
  }

}


@immutable
abstract class CatalogState {}

class LoadingCatalogState extends CatalogState{}

class ReadyCatalogState extends CatalogState {
  final List<Product> listProducts;
  ReadyCatalogState(this.listProducts);
}

@immutable
abstract class CatalogEvent {}

class RefreshCatalogEvent extends CatalogEvent{
  final int categoryIndex;
  RefreshCatalogEvent({required this.categoryIndex});
}


class ErrorCatalogState extends CatalogState {
  final dynamic error;

  ErrorCatalogState(this.error);
}