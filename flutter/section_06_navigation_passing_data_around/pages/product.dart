import "package:flutter/material.dart";

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  //constructor:
  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
//the image is a widget which will take the full available width,
//asa ca nu mai e nevoie sa centrezi tu butonul
            Text(title),
            RaisedButton(
//folosim culoarea pe care o avem definita in tema (butonul de back va fi purple)
              color: Theme.of(context).accentColor,
              child: Text("BACK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
    );
  }
}
//cand dai click pe details, te duce catre pagina asta, apoi fltr creaza un buton de back
//default, acesta te duce catre pagina de unde ai venit, dar poti modifica comportamentul
//astfel incat sa creezi propriul tau buton de back
//folosesti tot Navigator, doar ca acum cu pop() in loc de push()
