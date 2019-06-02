import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';
import "./pages/products.dart";

import './product_manager.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';

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
//      home: AuthPage(), //3
      //3 default starting page
      routes: { //4
        //5, 6
        "/" : (BuildContext context) => ProductsPage(),
        './admin': (BuildContext context) => ProductsAdminPage(),
      },
    );
  }
}
//4 routes is a map, the key is an identifier of the route (String)

//5 "/" is your home route

//6 iei eroare daca ai setat si ceva pt "/", care e home
//si ai si home: AuthPage() de ex, pt ca se bat cap in cap;

//*1 pana amu toate chestiile erau pe aceeasi pagina practic, pt ca aveai
//un singur Scaffold. restul widgeturilor nu inlocuiau acest Scaffold (ceea ce s-ar intampla daca ar fi incarcate ca o pagina nou)
//ci erau parte din aceeasi pagina

//*2 IMPORTI CLASA DIN ALT FISIER ca functie: NumeClasa()
