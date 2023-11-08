
import 'package:burger_king/data/db/db_util.dart';
import 'package:burger_king/data/db/orm/orm_product.dart';

class DbModule{
  static DbUtil? _dbUtil;
  static OrmProduct? _ormProduct;

  static OrmProduct ormProduct(){
    if (_ormProduct == null){
      _ormProduct = OrmProduct(dbUtil());
    }
    return _ormProduct!;
  }

  static DbUtil dbUtil(){
    if (_dbUtil == null){
      _dbUtil = DbUtil();
    }
    return _dbUtil!;
  }
}