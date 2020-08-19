import 'package:flutter_pos/backend/database.dart';
import 'package:sqflite/sqflite.dart';

class Category {
  static const TABLE = 'categories';
  static const NAME = 'name';
  static const IMAGE = 'image';

  String _name;
  String _image;

  Category();

  Category.fromMap(Map<String, dynamic> map){
    _name = map[NAME];
    _image = map[IMAGE];
  }

  String get image { return  _image; }
  String get name { return _name; }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{NAME: _name, IMAGE: _image};
    return map;
  }


  // CRUD
  static Future<void> create(Category category) async {


    Database db = await DatabaseHandler.instance.database;
    await db.insert(TABLE, category.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);
  }

  static Future<Category> readByName(String name) async {
    Database db = await DatabaseHandler.instance.database;
    List<Map<String, dynamic>> categories = await db.query(TABLE, where: "$NAME = ?", whereArgs: [name]);
    return categories.isEmpty ? Category.fromMap(categories.first) : null;
  }
  static Future<List<Map<String, dynamic>>> readAll() async {
    Database db = await DatabaseHandler.instance.database;
    List<Map<String, dynamic>> categories = await db.query(TABLE);
    return categories;
  }


  static Future<void> update(Category category) async {
    Database db = await DatabaseHandler.instance.database;
    await db.update(TABLE, category.toMap(), where: "$NAME = ?", whereArgs: [category.name]);
  }

  static Future<void> delete(Category category) async {
    Database db = await DatabaseHandler.instance.database;
    await db.delete(TABLE, where: "$NAME = ?", whereArgs: [category.name]);
  }
}