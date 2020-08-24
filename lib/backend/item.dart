import 'package:flutter_pos/backend/database.dart';
import 'package:sqflite/sqflite.dart';

class Item {
  static const SOLD_BY_EACH = 'each';
  static const SOLD_BY_WEIGHT = 'weight';
  static const TABLE = 'items';
  static const NAME = 'name';
  static const IMAGE = 'image';
  static const CATEGORY = 'category';
  static const SOLD_BY = 'sold_by';
  static const PRICE = 'price';
  static const COST = 'cost';
  static const SKU = 'sku';
  static const TRACK_STOCK = 'track_stock';
  static const STOCKS = 'stocks';

  String _name;
  String _category;
  String _soldBy;
  String _image;
  double _price;
  double _cost;
  int _sku;
  bool _trackStock;
  int _stocks;

  Item();

  Item.fromMap(Map<String, dynamic> map) {
    _name = map[NAME];
    _image = map[IMAGE];
    _category = map[CATEGORY];
    _soldBy = map[SOLD_BY];
    _price = map[PRICE];
    _cost = map[COST];
    _sku = map[SKU];
    _trackStock = map[TRACK_STOCK];
    _stocks = map[STOCKS];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      NAME: _name,
      IMAGE: _image,
      CATEGORY: _category,
      SOLD_BY: _soldBy,
      PRICE: _price,
      COST: _cost,
      SKU: _sku,
      TRACK_STOCK: _trackStock,
      STOCKS: _stocks
    };
    return map;
  }

  String get image { return  _image; }
  String get name { return _name; }
  String get category { return _category; }

  // CRUD
  static Future<void> create(Item item) async {
    Database db = await DatabaseHandler.instance.database;
    await db.insert(TABLE, item.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);
  }

  static Future<Item> read(String name, String category) async {
    Database db = await DatabaseHandler.instance.database;
    List<Map<String, dynamic>> items = await db.query(TABLE, where: "$NAME = ? and $CATEGORY = ?", whereArgs: [name, category]);
    return items.isEmpty ? Item.fromMap(items.first) : null;
  }

  static Future<List<Map<String, dynamic>> > readAll() async {
    Database db = await DatabaseHandler.instance.database;
    List<Map<String, dynamic>> items = await db.query(TABLE);
    return items;
  }

  static Future<void> update(Item item) async {
    Database db = await DatabaseHandler.instance.database;
    await db.update(TABLE, item.toMap(), where: "$NAME = ? and $CATEGORY = ?", whereArgs: [item.name, item.category]);
  }

  static Future<void> delete(Item item) async {
    Database db = await DatabaseHandler.instance.database;
    await db.delete(TABLE, where: "$NAME = ? and $CATEGORY = ?", whereArgs: [item.name, item.category]);
  }
}
