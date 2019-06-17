import 'package:flutter/material.dart';
import 'package:section07/pages/product_edit.dart';
import "../models/product.dart";

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Product> products;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            //product: pt ca am named parameters{} in constructorul ProductEditPage
            return ProductEditPage(
              product: products[index],
              updateProduct: updateProduct,
              productIndex: index, //index e cel de sus de la itemBuilder
            );
          } //products[index] selects the product i wanna edit
              ),
        );
      },
    );
  }

//nu stiu cate produse voi avea, deci folosesc builder() pt ca performanta
//leading : apare inaintea textului, pe acelasi row
//trailing : apare dupa imagine, acelasi row
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        //Dismissible just removes from the view, doesn't autom remove the product
        //key tells fltr which item is swyped
        //background aici e bckgrd when we swype
        return Dismissible(
          key: Key(products[index].title),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            } else if (direction == DismissDirection.startToEnd) {
              print("start to end");
            } else {
              print("other swiping");
            }
          },
          background: Container(
            color: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
// CircleAvatar displays image in a circle
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index].image),
                ),

                title: Text(products[index].title),
                //pretul apare sub text:
                subtitle: Text("\$${products[index].price.toString()} "),
                //trailing is a widget on the right of the ListTile
                trailing: _buildEditButton(context, index),
              ),

              Divider() //paints horizontal line
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
