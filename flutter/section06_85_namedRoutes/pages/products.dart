import "package:flutter/material.dart";
import "../product_manager.dart";

//1 drawer is on the left; endDrawer is on the right

//2 it automatically implies what the first icon should be (punea alea 3 linii orizont)

class ProductsPage extends StatelessWidget {
  final List <Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsPage(this.products, this.addProduct, this.deleteProduct);


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
              Navigator.pushReplacementNamed(context, './admin');
            },
          )
        ],
      )),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(products, addProduct, deleteProduct),
    );
  }
}
