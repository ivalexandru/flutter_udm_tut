import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import "./pages/home.dart";

import './product_manager.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
//1*
//2*
      home: HomePage());
  }
}
//*1 pana amu toate chestiile erau pe aceeasi pagina practic, pt ca aveai
//un singur Scaffold. restul widgeturilor nu inlocuiau acest Scaffold (ceea ce s-ar intampla daca ar fi incarcate ca o pagina nou)
//ci erau parte din aceeasi pagina


//*2 IMPORTI CLASA DIN ALT FISIER ca functie: NumeClasa()