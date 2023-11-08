
import 'package:burger_king/data/db/db_scheme.dart';
import 'package:burger_king/data/db/db_util.dart';
import 'package:burger_king/data/db/mapper/product_mapper.dart';
import 'package:burger_king/domain/model/product.dart';
import 'package:burger_king/data/db/model/db_product.dart';

class OrmProduct {

  DbUtil _dbUtil;

  OrmProduct(
      this._dbUtil
      );

  Future<List<Product>> getListProduct() async {
    //делаем запрос, записываем результат (таблицу) в переменную maps
    final maps = await _dbUtil.get(ProductScheme.tableId);
    //записываем данные из map в объекты (в перем. dbProducts)
    final dbProducts = maps!
        .map((dbProduct) => DbProduct.fromMap(dbProduct))
        .toList();

    // переносим информацию из объектов бд в обычные объекты
    List<Product> products = [];
    for (DbProduct dbProduct in dbProducts){
      products.add(ProductMapper.fromDb(dbProduct));
    }
    // возвращаем список продуктов
    return products;
  }

  // Для добавления списка продуктов в базу (для кэширования)
  // Future<void> saveListProduct(List<Product> listProduct) async {
  //   // для каждого продукта в списке продуктов,
  //   // делается добавление продукта в базу.
  //   //изначально продукты обычные, из них делаем продукты Db и их добаляем в базу
  //   for (final product in listProduct){
  //     await _dbUtil.insert(
  //       ProductScheme.tableId,
  //       ProductMapper.toDb(product).toMap(),
  //     );
  //   }
  // }
}