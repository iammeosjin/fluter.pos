import 'package:flutter/material.dart';
import 'package:flutter_pos/reusable-ui/custom-list-tiles.dart';

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
            Navigator.pushReplacementNamed(context, '/sales');
          }),
          CustomListTiles.drawerListTile(context,
              icon: Icons.receipt, title: 'Assessment', onTap: () {
            Navigator.pushReplacementNamed(context, '/receipts');
          }),
          CustomListTiles.drawerListTile(context,
              icon: Icons.list, title: 'Inventory', onTap: () {}),
          CustomListTiles.drawerListTile(context,
              icon: Icons.settings, title: 'Settings', onTap: () {}),
        ],
      ),
    );
  }
}
