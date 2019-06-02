import "package:flutter/material.dart";
import "../product_manager.dart";
import "./products_admin.dart";
import "./testt_pageee.dart";
//1 drawer is on the left; endDrawer is on the right

//2 it automatically implies what the first icon should be (punea alea 3 linii orizont)

class ProductsPage extends StatelessWidget {
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
            title: Text("manage products"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsAdminPage()));
            },
          )
        ],
      )),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(),
    );
  }
}
