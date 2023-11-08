
import 'dart:io';

import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart';

import 'package:burger_king/data/db/db_scheme.dart';


class DbUtil{
  Database? _db;
  final _lock = new Lock();

  //шаблон для запроса к базе
  Future<List<Map<String, dynamic>>?> get(String table, {List<String>? columns, String? orderBy, String? where, List<dynamic>? whereArgs})
  async {
    final db = await _getDb();
    final result = await db?.query(
      table,
      where: where,
      whereArgs: whereArgs,
      columns: columns,
      orderBy: orderBy,
    );
    return result;
  }


  Future<Database?> _getDb() async {
    if (_db == null) {
      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await _open();
          await initDB(_db, ProductScheme.tableId);
        }
      });
    }
    return _db;
  }

  Future<Database?> _open() async {
    var path =  join(await getDatabasesPath(), "demo.db");
    if (Platform.isAndroid || Platform.isIOS){
      return openDatabase(
          path,
          version: 1,
          onCreate: _onCreate
      );
    }
  }

  // таблица по схеме (ProductScheme)
  Future<void> _onCreate(Database db, int version) {

    return Future.wait([
      db.execute(ProductScheme.getCreateSql()),
    ]);
  }

  // Добавление записи в базу
  Future<void> insert(String table, Map<String, dynamic> values, {ConflictAlgorithm? conflictAlgorithm}) async {
    final db = await _getDb();
    await db?.insert(table, values, conflictAlgorithm: conflictAlgorithm);
  }

  // инициализация Бд начальными данными
  Future<void> initDB(Database? db,String table,{ConflictAlgorithm? conflictAlgorithm}) async {

    db?.delete(table);
    List<Map<String, dynamic>> values = [
      {
        "product_id": 0,
        "product_title": "Комбо с Воппером Дж.",
        "product_image": "https://eda.yandex.ru/images/3508859/8a47c2777a6ec7b10da6fb414ce2046e-800x800.png",
        "product_price": 230
      },
      {
        "product_id": 1,
        "product_title": "Воппер с сыром",
        "product_image": "https://eda.yandex.ru/images/1387779/139e74037d55289065e600906a3822a9-800x800.jpeg",
        "product_price": 230
      },
      {
        "product_id": 2,
        "product_title": "Комбо на двоих c Воппер Роллом",
        "product_image": "https://eda.yandex.ru/images/3541746/f2c58630c144d37e709bfa52ac7687db-800x800.png",
        "product_price": 230
      },
      {
        "product_id": 3,
        "product_title": "Кинг Наггетс (станд.)",
        "product_image": "https://eda.yandex.ru/images/1962206/af975ace8e2a0ddf5153a5f47b8522d5-800x800.png",
        "product_price": 230
      },
      {
        "product_id": 4,
        "product_title": "Воппер Ролл",
        "product_image": "https://eda.yandex.ru/images/1380157/c40bac4de7da52de459fc5efa55c67b5-800x800.png",
        "product_price": 230
      },
      {
        "product_id": 5,
        "product_title": "Цезарь Кинг",
        "product_image": "https://eda.yandex.ru/images/1368744/89184f8bfaf684bb21705764536447a6-800x800.jpeg",
        "product_price": 230
      }
      ];

    for (var value in values){
      await db?.insert(table, value, conflictAlgorithm: conflictAlgorithm);
    }


  }

}

