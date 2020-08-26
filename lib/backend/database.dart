import 'dart:io';
import 'package:flutter_pos/backend/category.dart';
import 'package:flutter_pos/backend/item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static final _databaseName = "flutter_pos.db";
  static final _databaseVersion = 1;

  DatabaseHandler._privateConstructor();

  static final DatabaseHandler instance = DatabaseHandler._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> close() async {
    Database db = await database;
    db.close();
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${Category.TABLE} (
        ${Category.NAME} TEXT NOT NULL,
        ${Category.IMAGE} TEXT
      )
      '''
    );
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${Item.TABLE} (
        ${Item.NAME} TEXT NOT NULL,
        ${Item.IMAGE} TEXT,
        ${Item.CATEGORY} TEXT,
        ${Item.SOLD_BY} TEXT DEFAULT "each" NOT NULL,
        ${Item.PRICE} REAL DEFAULT 0.0 NOT NULL,
        ${Item.COST} REAL NOT NULL,
        ${Item.SKU} INTEGER NOT NULL,
        ${Item.TRACK_STOCK} INTEGER DEFAULT 0 NOT NULL,
        ${Item.STOCKS} INTEGER
      )
      '''
    );
  }

}