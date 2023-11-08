// схема БД

import 'package:burger_king/data/db/model/db_product.dart';

class ProductScheme {
  static final String tableId = 'product_table';
  static final String columnId = DbProduct.ID;
  static final String columnTitle = DbProduct.TITLE;
  static final String columnImage = DbProduct.IMAGE;
  static final String columnPrice =DbProduct.PRICE;

  static String getCreateSql() {
    return ''' 
    create table
    $tableId (
    $columnId integer primary key autoincrement,
    $columnTitle text not null,
    $columnImage text not null,
    $columnPrice real not null)
    ''';
  }
}