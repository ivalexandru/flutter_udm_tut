import "package:flutter/material.dart";
//dai import si paginii pe care vrei sa te duca dupa login:
import "./products.dart";
//inainte de orice, te duce catre pagina asta de login,
// dupa ce te loghezi, nu te mai lasa sa te intorci aici ca nu ai de ce
//momentan nu te loghezi, e doar un buton care te duce pe pagina products..

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: RaisedButton(
              child: Text("LogIn"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsPage()),
                );
              })),
    );
  }
}
