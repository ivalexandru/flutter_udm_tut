import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
     final double deviceWidth = MediaQuery.of(context).size.width;
     //daca e mai lat de 550 pun 500px, altminteri 95% ecran
     final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95; 
     final double targetPadding = deviceWidth - targetWidth;


//ListView is SPECIAL, the children in the ListView, 
// by default, WILL ALWAYS TAKE THE FULL WIDTH/HEIGHT
//pt asta, te folosesti de padding:
    return Container(
      width: targetWidth,
      margin: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding/2),
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Save'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: _submitForm,
          )
        ],
      ),
    );
  }
}
