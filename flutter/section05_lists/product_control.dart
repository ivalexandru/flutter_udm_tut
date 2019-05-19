import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{
//recieve a func reference and store it in a property of the class
//nu tre sa aiba acelasi nume ca in functie
//in this property we'll store the reference of a function
//so, AVEM ACCES LA FUNCTIE IN ACEST WIDGET
// (functia nu e definita in acest widget)
final Function addProduct;

//final does require an initializer. The reason it works in this case
// is that the value is being set in the Class constructor (this.ceva)
// and that qualifies as the initializer as the class cannot be instantiated
// without having it's constructor called and therefore the final property being initialized.

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      //primaryColor e cea setata in theme: ThemeData() in main.dart
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct("sweets");
      },
      child: Text('Add Product'),
    );
  }

}


