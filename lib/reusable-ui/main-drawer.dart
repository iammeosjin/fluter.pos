import 'package:flutter/material.dart';
import 'package:flutter_pos/reusable-ui/custom-list-tiles.dart';
import 'package:flutter_pos/routes/inventory.dart';
import 'package:flutter_pos/routes/receipts.dart';
import 'package:flutter_pos/routes/sales.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 80,
            child: DrawerHeader(
              decoration: new BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          CustomListTiles.drawerListTile(context,
              icon: Icons.shopping_basket, title: 'Transaction', onTap: () {
            Navigator.pushReplacementNamed(context, SalesPage.ROUTE);
          }),
          CustomListTiles.drawerListTile(context,
              icon: Icons.receipt, title: 'Assessment', onTap: () {
            Navigator.pushReplacementNamed(context, ReceiptsPage.ROUTE);
          }),
          CustomListTiles.drawerListTile(context,
              icon: Icons.list, title: 'Inventory', onTap: () {
            Navigator.pushReplacementNamed(context, InventoryPage.ROUTE);
          }),
          CustomListTiles.drawerListTile(context,
              icon: Icons.settings, title: 'Settings', onTap: () {}),
        ],
      ),
    );
  }
}
