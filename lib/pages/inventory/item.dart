import 'package:flutter/material.dart';
import 'package:flutter_pos/pages/inventory/create-item.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () { Navigator.pop(context); },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('All Items'),
        actions: <Widget>[
          InkWell(
            child: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateItemPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
