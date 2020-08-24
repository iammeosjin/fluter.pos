import 'package:flutter/material.dart';
import 'package:flutter_pos/backend/item.dart';

class CreateItemPage extends StatefulWidget {
  @override
  _CreateItemPageState createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {

  String _name;
  String _category;
  String _soldBy;
  String _image;
  double _price;
  double _cost;
  int _sku;
  bool _trackStock;
  int _stocks;

  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty){

          return 'Name is required';
        }

        return null;
      },
      autovalidate: true,
      autocorrect: false,
      autofocus: false,
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildCategoryField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty){

          return 'Name is required';
        }

        return null;
      },
    );
  }

  Widget _buildSoldByField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Sold By'),
          Row(
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
          Row(
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
        ],
      ),
    );
  }

  Widget _buildImageField() {
    return null;
  }

  Widget _buildPriceField() {
    return TextFormField(
      autovalidate: true,
      decoration: InputDecoration(labelText: 'Price', helperText: '(Optional)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty){
          return null;
        }

        double price = double.tryParse(value);
        if (price == null  || price < 0) {
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
      autovalidate: true,
      decoration: InputDecoration(labelText: 'Cost'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        double cost = double.tryParse(value);
        if (cost == null  || cost <= 0) {
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
      autovalidate: true,
      decoration: InputDecoration(labelText: 'Cost'),
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
    return null;
  }

  Widget _buildStocksField() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _trackStock = false;
    _soldBy = Item.SOLD_BY_EACH;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () { Navigator.pop(context); },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Create Item'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        child: Form(
          key: _formKeys,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildNameField(),
              SizedBox(height: 10),
              _buildSoldByField(),
              _buildPriceField(),
              _buildCostField(),
              _buildSKUField(),
              /*
              _buildCategoryField(),
              _buildTrackStockField(),
              _buildStocksField(),
               */
            ],
          ),
        ),
      ),
    );
  }
}
