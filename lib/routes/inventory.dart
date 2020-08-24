import 'package:flutter/material.dart';
import 'package:flutter_pos/pages/inventory/item.dart';
import 'package:flutter_pos/reusable-ui/main-drawer.dart';

class InventoryPage extends StatelessWidget {
  static const ROUTE = '/inventory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.list),
            title: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ItemPage()),
                );
              },
              child: Text('Items'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.content_copy),
            title: Text('Category'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Discounts'),
          ),
        ],
      ),
    );
  }
}
