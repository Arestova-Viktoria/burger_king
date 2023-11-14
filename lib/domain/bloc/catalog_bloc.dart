import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:burger_king/domain/repository/product_repository.dart';

import '../model/product.dart';


class CatalogBloc extends Bloc<CatalogEvent,CatalogState>{

  ProductRepository _productDataRepository;

  CatalogBloc(
      this._productDataRepository,
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
      final listProducts = _productDataRepository.getListProduct();
      return ReadyCatalogState(listProducts);
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

class RefreshCatalogEvent extends CatalogEvent{}


class ErrorCatalogState extends CatalogState {
  final dynamic error;

  ErrorCatalogState(this.error);
}