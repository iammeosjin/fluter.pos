import 'package:flutter/material.dart';
import 'package:flutter_pos/backend/session.dart';
import 'package:flutter_pos/main.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 80,
            child: UserAccountsDrawerHeader(
              accountName: Text(Session.user.getName()),
              accountEmail: Text(Session.user.getEmail()),
              decoration: new BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          CustomDrawerListTile(Icons.shopping_basket, 'Sales', () { Navigator.pushReplacementNamed(context, '/sales'); }),
          CustomDrawerListTile(Icons.receipt, 'Receipts', () { Navigator.pushReplacementNamed(context, '/receipts'); }),
          CustomDrawerListTile(Icons.list, 'Items', () {}),
          CustomDrawerListTile(Icons.settings, 'Settings', () {}),
        ],
      ),
    );
  }
}

class CustomDrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  CustomDrawerListTile(this.icon, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onTap,
        child: Container(
          height: 40,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}