import 'package:flutter_pos/backend/category.dart';
import 'package:flutter_pos/backend/database.dart';

class CategoryHandler {
  List<Category> categories;

  void loadFromDB () {
    categories = Database.categories.map( (category) => Category(category['name']) ).toList();
  }

  Category findByName(String name) {
    return categories.singleWhere((element) => element.name == name, orElse: () => null);
  }
}