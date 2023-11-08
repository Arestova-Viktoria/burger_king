import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:burger_king/data/repository/product_data_repository.dart';


class CatalogBloc extends Bloc<CatalogEvent,CatalogState>{

  ProductDataRepository _productDataRepository;

  CatalogBloc(
      CatalogState initialState,
      this._productDataRepository,
      ) : super(initialState);


  CatalogState get initialState => LoadingCatalogState();

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is RefreshCatalogEvent) {
      yield await _mapRefreshToState(event);
    }
  }

  Future<CatalogState> _mapRefreshToState(RefreshCatalogEvent event) async {
    try {
      final listProducts = await _productDataRepository.getListProduct();
      //print(listProducts);
      return ReadyCatalogState(listProducts);
    } catch(e) {
      print(e);
      return ErrorCatalogState(e);
    }
  }

}


@immutable
abstract class CatalogState {}

class LoadingCatalogState extends CatalogState{}

class ReadyCatalogState extends CatalogState {
  final listProducts;
  ReadyCatalogState(this.listProducts);
}

@immutable
abstract class CatalogEvent {}

class RefreshCatalogEvent extends CatalogEvent{}


class ErrorCatalogState extends CatalogState {
  final dynamic error;

  ErrorCatalogState(this.error);
}