import 'package:flutter_pos/backend/category.dart';

enum SoldBy {
  each,
  weight
}

class Item {
  String _name;
  Category _category;
  SoldBy _soldBy;
  double _price;
  double _cost;
  int _sku;
  bool _trackStock;
  int _stocks;

  Item({ String name, Category category, SoldBy soldBy = SoldBy.each, double price = 0, double cost, int sku, bool trackStock = false, int stocks = 0 }) {
    this._name = name;
    this._category = category;
    this._soldBy = soldBy;
    this._price = price;
    this._cost = cost;
    this._sku = sku;
    this._trackStock = trackStock;
    this._stocks = stocks;
  }
}