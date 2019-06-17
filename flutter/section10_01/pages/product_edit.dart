import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

// {} - make arguments named and optional
// [] marks them as optional positional parameters
  ProductEditPage({this.addProduct, this.updateProduct, this.product, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  //final because we won't assign a new value to it, we will change the internal value
  //si unde aveam _titleValue de ex folosesti amu _formData['title']
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': "./assets/food.jpg",
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      initialValue:
          widget.product == null ? '' : widget.product['title'],
      validator: (String value) {
        // if (value.trim().length <= 0) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long.';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
            initialValue:
          widget.product == null ? '' : widget.product['description'],
      validator: (String value) {
        // if (value.trim().length <= 0) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and should be 10+ characters long.';
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      //initialValue to prepopulate form fields
      //also, verifica product e setat(nu-i null)
      //daca e null, il setezi ca empty string, daca nu e, il initializezi
      initialValue:
          widget.product == null ? '' : widget.product['price'].toString(),
      validator: (String value) {
        // if (value.trim().length <= 0) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number.';
        }
      },
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  Widget _buildPageContent(BuildContext context){
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: _submitForm,
              )
              // GestureDetector(
              //   onTap: _submitForm,
              //   child: Container(
              //     color: Colors.green,
              //     padding: EdgeInsets.all(5.0),
              //     child: Text('My Button'),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  //verific daca am deja un produs si il editez sau daca il creez
  if(widget.product == null){
    widget.addProduct(_formData);
  } else { //update:
    widget.updateProduct(widget.productIndex, _formData);
  } //widget.productIndex pt ca suntem in STATE

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _buildPageContent(context);

//hide keyboard
//gestureDetector de aici va include si form-ul, unde nu vreau sa ascund tastatura
//cand dau click, dar pt ele, the native listeners will take priority(la fel si pt butoane)
//every text field has a focus node, if u wanna remove focus,
// create an empty focus node asa: FocusNode()

//daca e null => adaugam un produs
//nu e null =>
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit prod'),
            ),
            body: pageContent,
          );
  }
}
