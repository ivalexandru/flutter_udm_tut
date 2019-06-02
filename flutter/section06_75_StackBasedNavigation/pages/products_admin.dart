import "package:flutter/material.dart";
//importi pagina unde vrei sa te duca onClick/onTap
import './products.dart';
//2 if true, it automatically implies what the first icon should be (punea alea 3 linii orizont)
//3 pagina unde vrei sa te duca
//4 pushReplacement in loc de push pt ca nu vrei sa ai 'back' buttn
class ProductsAdminPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        //1
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false, //2
                title: Text("choose"),
              ),
              ListTile(
                title: Text("All products"),
                onTap: () {
                  Navigator.pushReplacement( //4
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductsPage())); //3
                },
              )
            ],
          )),

      appBar: AppBar(title: Text("mnge prods"),
      ),
      body: Center(child: Text("manage products"),
      ),
    );
  }

}