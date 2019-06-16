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
  //we assign this key to the Form(key: aici)
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


// onSaved() =  executed when the overall form is submitted
//value = value that we entered
//in Form, setezi tu when onSaved() fires, with the "key" argument
//key = global identifier that allows us to access the form obj from other parts of our app
  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),

//apare msg 'title is required pana cand nu mai e == 0 value,
//imediat ce tastezi ceva, dispare mesajul
  // autovalidate: true, 
//dar apare si daca nu a scris inca nimic, asa ca fol varianta
//in care pun chestia asta in _submitForm


//the string we return will act as an err msg if validation fails
//if validation successss, return null (NU RETURNEZI NIMIC)
//trim() removes excess whitespace (de dinainte sau dupa)
      validator: (String value){
        if (value.trim().length <= 0 || value.length < 5 ) {
          return "Title required and must have 5+ chars";
        } 
      },
      onSaved: (String value){
        setState( () {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
            validator: (String value){
        if (value.isEmpty || value.length < 10 ) {
          return "description required and must have 10+ chars";
        } 
      },
            onSaved: (String value){
        setState( () {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
            validator: (String value){

              //fail if isEmpty or not ( ! )  a number
              // .hasMatch(value) verifica daca regex sau ce pun eu in fata e valid
              //permiti doar punct, nu si virgula pt despartitor de zecimale, altfel nu ai putea face parse
        if (value.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value) ) {
          return "Price required and must be a nr";
        } 
      },
            onSaved: (String value){
        setState( () {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    //varianta asta arata mesajul de eroare doar dupa ce a incercat sa submit form
    //daca nu sunt toate forms valide, return si nu mai rulezi ce e mai jos deci nu mai submit
     if( ! _formKey.currentState.validate()){
       return;
     } 

    //when we call the save method on the state returned 
    // by the _formKey(which sets a connection to the Form widget)
    //the onSaved() will be executed for every text field
    _formKey.currentState.save();
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
      

      child: Form(child: ListView(
        key: _formKey,
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
            textColor: Colors.white,
            onPressed: _submitForm,
          )

        //build your own button (cu bautura si...)
        //GestureDetector() widget adds tap events to the elements it wraps
        // GestureDetector(
        //   onTap: _submitForm,
        //   child: Container(  
        //     color: Colors.green,
        //     padding: EdgeInsets.all(5.0),
        //     child: Text("My Buttn"),
        //   ), ),


        ],
      ),
      ),
    );
  }
}
