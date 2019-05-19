import 'package:flutter/material.dart';

import './product_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
//        brightness: Brightness.dark, face overrite si la astea de jos
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: ProductManager(startingProduct: "food tester"), // *1*
      ),
    );
  }
}
// *1* food tester e preluat de clasa ProductManager si de metoda initState()
//a.incat la primul build acesta este produsul initial.