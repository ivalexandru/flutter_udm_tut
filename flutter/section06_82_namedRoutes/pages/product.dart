import "package:flutter/material.dart";
import "dart:async";

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  //constructor:
  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
//    WillPopScope listens to the back button being pressed
    return WillPopScope(
      onWillPop: () {
        print("Back button pressed");
        Navigator.pop(context, false); //*1
        return Future.value(false); //*2

//*1
//amu tre sa specificam
// ca vrem sa iesim de pe pagina, pt ca am dat override
// comportamentului default care era sa iasa de pe pagina
// cand am folosit metoda onWillPop

//false indicates that whenever the user goes back
// trough the back button, we do NOT want to delete

//*2
//onWillPop returns a future, asa ca ai nevoie de pachetul
// import "dart:async";
// true means you are allowed to leave the page
//dar pui false pt ca tu ai 2 pop requests aici, una initiala de la WillPopScope,
// pe care vrei sa o ignori si sa o fol pe cea pe care ai definit-0 tu cu Navigator.pop(...
//daca nu faci asta, se vor bate cap in cap si err
      },
      child: Scaffold(
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
              child: Text("DELETE"),
              onPressed: () => Navigator.pop(context, true),
            )
          ],
        ),
      ),
    );
  }
}
//cand dai click pe details, te duce catre pagina asta, apoi fltr creaza un buton de back
//default, acesta te duce catre pagina de unde ai venit, dar poti modifica comportamentul
//astfel incat sa creezi propriul tau buton de back
//folosesti tot Navigator, doar ca acum cu pop() in loc de push()
