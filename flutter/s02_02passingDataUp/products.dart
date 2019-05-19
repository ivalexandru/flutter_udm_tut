import 'package:flutter/material.dart';


//the change of data happens somewhere else, asa ca poti pune aici stateLESS
//widgetul Products doar primeste o lista de prod, lista aceea ar putea fi schimbata

class Products extends StatelessWidget {
  //final => the value of products will never change
  final List<String> products;
  //constructor:
  //need this to accept the incoming data de la celalalt widget

  //oprional args need to wrap the entire assingment with []
  //for named ones use {}
  // const []  aka lista ce nu poate fi schimbata (nici cu add())
  Products( [this.products = const [] ] ){
    print("[Products Widget] Constructor");
  }

  @override
  Widget build(BuildContext context) {
    print("[Products Widget] build()");
    return Column(
      children: products
          .map(
            (element) => Card(
          child: Column(
            children: <Widget>[
              Image.asset('assets/food.jpg'),
              Text(element)
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}
