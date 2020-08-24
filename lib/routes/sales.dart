import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/backend/category.dart';
import 'package:flutter_pos/backend/item.dart';
import 'package:flutter_pos/reusable-ui/custom-list-tiles.dart';
import 'package:flutter_pos/reusable-ui/main-drawer.dart';
import 'package:flutter_pos/routes/inventory.dart';

class SalesPage extends StatelessWidget {
  static const ROUTE = '/sales';

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
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.3,
                      child: Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        alignment: Alignment.center,
                        color: Colors.green,
                        child: Text('CHARGE\n0.00'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  height: 60,
                                  padding: EdgeInsets.only(left: 15, right: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: CustomDropDownButton(),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Icon(Icons.search),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: FutureBuilder(
                                    future: Item.readAll(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                          child: Center(
                                            child: Text('Loading...'),
                                          ),
                                        );
                                      }
                                      if (snapshot.data.length == 0) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text('You have no items yet'),
                                                  Text(
                                                      'Go to items menu to add an item'),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pushReplacementNamed(context, InventoryPage.ROUTE);
                                                    },
                                                    child: Container(
                                                        width: 120,
                                                        height: 50,
                                                        color: Colors.green,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'GO TO ITEMS',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      }

                                      return ListView.builder(
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            String image =
                                                'images/image-404.png';
                                            Category category =
                                                Category.fromMap(
                                                    snapshot.data[index]);
                                            return CustomListTiles.itemListTile(
                                                context,
                                                image: image,
                                                title: category.name);
                                          });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropDownButton extends StatefulWidget {
  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String _value = 'All Items';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        isDense: true,
        isExpanded: true,
        value: _value,
        onChanged: (String value) {
          setState(() {
            _value = value;
          });
        },
        items: <String>['All Items', 'Discounts'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(value),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
