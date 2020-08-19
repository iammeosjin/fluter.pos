import 'package:flutter/material.dart';
import 'package:flutter_pos/backend/handlers/category.dart';
import 'package:flutter_pos/backend/handlers/item.dart';
import 'package:flutter_pos/backend/session.dart';
import 'package:flutter_pos/backend/user.dart';
import 'package:flutter_pos/routes/receipts.dart';
import 'package:flutter_pos/routes/sales.dart';

void main() {

  Session.user = User();
  Session.categoryHandler = CategoryHandler();
  Session.categoryHandler.loadFromDB();

  Session.itemHandler = ItemHandler();
  Session.itemHandler.loadFromDB();
  runApp(
    POSApplication(),
  );
}

class POSApplication extends StatefulWidget {
  @override
  _POSApplicationState createState() => _POSApplicationState();
}

class _POSApplicationState extends State<POSApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/sales',
      routes: {
        '/sales': (context) => SalesPage(),
        '/receipts': (context) => ReceiptsPage(),
      },
    );
  }
}
