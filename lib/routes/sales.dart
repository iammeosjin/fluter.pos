import 'package:flutter/material.dart';
import 'package:flutter_pos/reusable-ui/main-drawer.dart';

class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                child: Container(
                  child: Container(
                    margin: EdgeInsets.all(size.width * .05),
                    padding: EdgeInsets.only(top: size.width * .05, bottom: size.width * .05),
                    width: size.width *.9,
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: Text('CHARGE\n0.00'),
                  ),
                )
            ),
            Container(
              child: Text('test1'),
            ),
          ],
        ),
      ),
    );
  }
}
