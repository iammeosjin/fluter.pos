import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/backend/category.dart';
import 'package:flutter_pos/backend/item.dart';
import 'package:flutter_pos/reusable-ui/custom-list-tiles.dart';
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
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: CustomDropDownButton(),
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Icon(Icons.search),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: FutureBuilder(
                                    future: Item.readAll(),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                          child: Center(
                                            child: Text('Loading...'),
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            String image = 'images/image-404.png';
                                            Category category = Category.fromMap(snapshot.data[index]);
                                            return CustomListTiles.itemListTile(context, image: image, title: category.name);
                                          }
                                      );
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

  @override
  Widget build(BuildContext context) {
    String _value = 'All Items';

    return DropdownButton(
      value: _value,
      onChanged: (String value ) {
        setState(() {
          _value = value;
        });
      },
      items: <String>['All Items', 'Discounts'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
