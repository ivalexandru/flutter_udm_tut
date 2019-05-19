import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

//stateFUL pt ca lista de produse se modifica
class ProductManager extends StatefulWidget {
  //the changes are in the state class( aia de jos, _ProductM...),
  // not in the widget classs (adica nu in asta), de aia pui final jos
  final String startingProduct;

  //am pus param constructorului intre {}
  // so now it's a named argument
  // = "Sets Default Value"
  //argumentul default e suprascris daca pui in main startingProduct: "ceva"
  ProductManager({this.startingProduct = "Sweets Tester"}){
    print("[PM Widget] Constructor");
  }

  @override
  State<StatefulWidget> createState() {
    print("[PM Widget] createState()");
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  // widget = a property that gives you access to all the properties of the parent widget that belongs to the state
  //aka sus(in widget) am startingProduct si voiam sa il folosest si aici
  //nu merge folosit direct, cand initializezi properties, tre sa il bagi intr-o metoda
  @override
  void initState() {
    print("[PM State] initState()");
    super.initState();
    _products.add(widget.startingProduct);
  } //super always refers to the base class you're extending, deci State aici
  //it calls initState() on THAT class (State aici), chiar daca ai facut @override
  //initState executa(ruleaza) INAINTE ca build sa ruleze !!

  //will be executed whenever your connected widget (ProductManager aici)
  //recieves new external data
  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print("[PM State] didUpdateWidget()");
    super.didUpdateWidget(oldWidget);
  }

//LIFT THE STATE UP:
//  "_" pt ca e folosit doar in acest fisier si nu vreau ca cineva
//  sa acceseze direct aceasta metoda
//i wanna call _addProduct whenever a button is pressed
//but, the button is in another widget !!
  //to give another widget access to a method in this widget
  //we pass a reference to the widget that should have this access
  //aka pasam _addProduct ca variabila, nu ca functie()
  //daca pasam ca functie executa imediat, eu verau sa execute cand apas btn
  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
  }



  @override
  Widget build(BuildContext context) {
    print("[PM Widget] Build");
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        //pasezi _products widgetului Products din fisierul products.dart
        Products(_products)
      ],
    );
  }
}



