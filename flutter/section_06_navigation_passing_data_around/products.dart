import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;

  Products([this.products = const []]) {
    print('[Products Widget] Constructor');
  }
//index de aici e pasat mai jos lui products
  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
// ['image'] este key`ul in cazul asta
          Image.asset(products[index]["image"]),
          Text(products[index]["title"]),

// ButtonBar allows u 2 add btns side by side
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProductPage(products[index]["title"], products[index]["image"]),
                      ),
                    ),
//Navigator e built-in, 'context' -param widgetului stie sa se manageruiasca
//the application scope; aka stie pe ce pagina esti
//iar Navigator se foloseste de asta
//in main.dart, cream MaterialApp.. care sets up this Navigator
//aka daca nu returnezi MaterialApp nu poti folosi Navigator
//Navigator.push() creeaza o pagina noua
//pages are managed as a stack, you always see the topmost page
//navighezi, le reordonezi cu push() si pop()
//nu facem push cu fisierul paginii, ci cu RUTA: MaterialPageRoute
//functia builder specifica catre ce pagina duce ruta
              )
            ],
          )
        ],
      ),
    );
  }

  // !!! MAKE SURE TO WRAP ListView into a fixed-height Container
  //or Expandable Widget if it's not the only WIdget on the screen !!

  //daca nu e niciun item, apare textul, daca sunt iteme, apare ListView
  Widget _buildProductList() {
    Widget productCards; //undefined
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
//aici pui Container() gol ca sa nu iei eroare
//cand incerci sa returnezi undefined
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
