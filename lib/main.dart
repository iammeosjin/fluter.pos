import 'package:flutter/material.dart';
import 'package:flutter_pos/backend/category.dart';
import 'package:flutter_pos/routes/receipts.dart';
import 'package:flutter_pos/routes/sales.dart';

void main() async {
  runApp(
    POSApplication(),
  );
}

class POSApplication extends StatefulWidget {
  static const USE_DATABASE = false;

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
