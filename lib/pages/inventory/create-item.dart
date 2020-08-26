import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/backend/item.dart';

class CreateItemPage extends StatefulWidget {
  @override
  _CreateItemPageState createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  String _name;
  String _category = 'No Category';
  String _soldBy = Item.SOLD_BY_EACH;
  String _image;
  double _price;
  double _cost;
  int _sku;
  bool _trackStock = false;
  int _stocks;

  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Create Item'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKeys.currentState.validate()) {
                _formKeys.currentState.save();
                String category = _category == 'No Category' ? null : _category;
                print('$_name $category $_soldBy $_image $_price $_cost $_sku $_trackStock $_stocks');
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Form(
            key: _formKeys,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Column(
                      children: <Widget>[
                        _buildNameField(),
                        SizedBox(height: 20),
                        _buildCategoryField(),
                        SizedBox(height: 20),
                        _buildSoldByField(),
                        _buildPriceField(),
                        _buildCostField(),
                        _buildSKUField(),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Inventory'),
                        _buildTrackStockField(),
                        _buildStocksField(),
                      ],
                    ),
                  ),
                ),
                /*
              _buildCategoryField(),
              _buildTrackStockField(),
              _buildStocksField(),
               */
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }

        return null;
      },
      autocorrect: false,
      autofocus: false,
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildCategoryField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Category', style: TextStyle(color: Colors.grey[600]),),
          DropdownButton(
            isDense: true,
            isExpanded: true,
            value: _category,
            items: ['No Category', 'Create Category'].map((value) {
              if (value == 'Create Category') {
                return DropdownMenuItem(
                  value: value,
                  child: InkWell(
                    child: Text(value),
                  ),
                );
              }
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {
                if (value != 'Create Category') {
                  _category = value;
                }
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildSoldByField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Sold By'),
          Container(
            height: 30,
            child: InkWell(
              onTap: () {
                setState(() {
                  _soldBy = Item.SOLD_BY_EACH;
                });
              },
              child: Row(
                children: <Widget>[
                  Radio(
                    value: Item.SOLD_BY_EACH,
                    groupValue: _soldBy,
                    onChanged: (String value) {
                      setState(() {
                        _soldBy = value;
                      });
                    },
                  ),
                  Flexible(
                    child: Text('Each'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            child: InkWell(
              onTap: () {
                setState(() {
                  _soldBy = Item.SOLD_BY_WEIGHT;
                });
              },
              child: Row(
                children: <Widget>[
                  Radio(
                    value: Item.SOLD_BY_WEIGHT,
                    groupValue: _soldBy,
                    onChanged: (String value) {
                      setState(() {
                        _soldBy = value;
                      });
                    },
                  ),
                  Flexible(
                    child: Text('Weight'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageField() {
    return null;
  }

  Widget _buildPriceField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price', helperText: '(Optional)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return null;
        }

        double price = double.tryParse(value);
        if (price == null || price < 0) {
          return 'Price must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _price = double.tryParse(value);
      },
    );
  }

  Widget _buildCostField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Cost'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        double cost = double.tryParse(value);
        if (cost == null || cost <= 0) {
          return 'Cost is required and must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _cost = double.tryParse(value);
      },
    );
  }

  Widget _buildSKUField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'SKU'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int _sku = int.tryParse(value);
        if (_sku == null) {
          return 'SKU is required';
        }

        return null;
      },
      onSaved: (String value) {
        _sku = int.tryParse(value);
      },
    );
  }

  Widget _buildTrackStockField() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Text('Track Stocks'),
          ),
          Flexible(
            flex: 2,
            child: Switch(
              value: _trackStock,
              onChanged: (value) {
                setState(() {
                  _trackStock = value;
                  if (!value) {
                    _stocks = 0;
                  }
                });
              },
              activeTrackColor: Colors.greenAccent,
              activeColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStocksField() {
    return Visibility(
      visible: _trackStock,
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Stocks'),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int stocks = int.tryParse(value);
          if (stocks == null || stocks <= 0) {
            return 'Stocks is required and must be greater than 0';
          }

          return null;
        },
        onSaved: (String value) {
          _stocks = int.tryParse(value);
        },
      ),
    );
  }
}

