import 'dart:async';
import 'package:burger_king/domain/model/category.dart';
import 'package:burger_king/domain/repository/category_repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent,CategoriesState>{

  final CategoryRepository _categoryRepository;

  CategoriesBloc(
      this._categoryRepository
      ) : super(LoadingCategoriesState());


  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is RefreshCategoriesEvent) {
      yield await _mapRefreshToState(event);
    }
  }

  Future<CategoriesState> _mapRefreshToState(RefreshCategoriesEvent event) async {
    try {
      final listCategories = _categoryRepository.getListCategory();
      return ReadyCategoriesState(listCategories);
    } catch(e) {
      return ErrorCategoriesState(e);
    }
  }


}

@immutable
abstract class CategoriesEvent {
}

class RefreshCategoriesEvent extends CategoriesEvent{}


@immutable
abstract class CategoriesState {
}

class LoadingCategoriesState extends CategoriesState{}

class ReadyCategoriesState extends CategoriesState {
  final List<Category> listCategories;
  ReadyCategoriesState(this.listCategories);
}

class ErrorCategoriesState extends CategoriesState {
  final dynamic error;

  ErrorCategoriesState(this.error);
}