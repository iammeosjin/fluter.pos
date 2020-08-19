import 'package:flutter_pos/backend/category.dart';
import 'package:flutter_pos/backend/database.dart';
import 'package:flutter_pos/backend/item.dart';
import 'package:flutter_pos/backend/session.dart';

class ItemHandler {
  List<Item> items;

  void loadFromDB() {
    items = Database.items
        .map(
          (item) => Item(
          name: item['name'],
          category: Session.categoryHandler.findByName(item['category']),
          soldBy: item['soldBy'] == 0 ? SoldBy.each : SoldBy.weight,
          price: item['price'],
          cost: item['cost'],
          sku: item['sku'],
          trackStock: item['trackStock'],
          stocks: item['stocks']
      ),
    )
        .cast<Item>()
        .toList();

    print(items[0]);
  }
}
