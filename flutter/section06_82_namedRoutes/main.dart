import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';
import "./pages/products.dart";

import './product_manager.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
    print(_products);
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

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

      routes: {
        //4
        //5, 6
        "/": (BuildContext context) =>
            ProductsPage(_products, _addProduct, _deleteProduct),
        './admin': (BuildContext context) => ProductsAdminPage(),
      },
      //7
      //we use onGenerateRoute to dynamically parse our own route name and extract the index from it.
      onGenerateRoute: (RouteSettings settings) {
        //8
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        } //verif ca ruta incepea cu /

        if (pathElements[1] == 'product') {
          // 9
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]["title"], _products[index]["image"]),
          );
        }
        //else
        return null;
      },

      //will execute whenever onGenerateRoute fails to generate the route
      //de ex, some fallback dummy page
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(_products, _addProduct, _deleteProduct));
      },
    );
  }
}
//9 to find out what the index of the image is;
//int.parse converteste stringul in integer (ultimul element din ruta)

//8 the settings hold the name that we want to navigate to
//name e property
//dupa ce faci split la /, vei avea ceva de genul 'string gol', './product/1'
//tu vrei sa iti rezulte o lista care sa aiba elementele product si 1
//intai verifici daca primul element din lista nu este zero; adica sari peste el,
// caci cu siguranta va fi un string gol, asa face split()
//daca primul element nu e string gol, inseamna ca nu incepea cu / ruta !

//7 if the product you wanna load is dynamic,
// it would be nice to get that extra info as part as the url
//onGenerateRoute is executed when we navigate to a named route,
// THAT IS NOT REGISTERED IN OUR ROUTE REGISTRY; and returns a new route

//4 routes is a map, the key is an identifier of the route (String)

//5 "/" is your home route

//6 iei eroare daca ai setat si ceva pt "/", care e home
//si ai si home: AuthPage() de ex, pt ca se bat cap in cap;

//*1 pana amu toate chestiile erau pe aceeasi pagina practic, pt ca aveai
//un singur Scaffold. restul widgeturilor nu inlocuiau acest Scaffold (ceea ce s-ar intampla daca ar fi incarcate ca o pagina nou)
//ci erau parte din aceeasi pagina

//*2 IMPORTI CLASA DIN ALT FISIER ca functie: NumeClasa()
