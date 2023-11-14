
import 'package:burger_king/data/products_data.dart';

class DataModule{
  static ProductsData? _productsData;

  static ProductsData productsData(){
    if (_productsData == null) {
      _productsData = ProductsData();
    }
    return _productsData!;
  }

}