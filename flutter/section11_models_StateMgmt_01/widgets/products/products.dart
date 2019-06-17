import 'package:flutter/material.dart';
import "package:scoped_model/scoped_model.dart";
import 'package:section07/scoped-models/products.dart';

import './product_card.dart';
import "../../models/product.dart";
import "../../scoped-models/products.dart";

class Products extends StatelessWidget {

//<Product> e modelul pe care l-am definit eu pt produs, cu title etc,  
// si pe care il folosesc ca si custom type, (a nu fi confundat cu scoped model..)
  Widget _buildProductList(List<Product> products) {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');

//scopedModel will call this builder whenever data in this model changes
// <ProductsModel> e cel definit de mine
    return ScopedModelDescendant<ProductsModel>(builder: (
      BuildContext context,
      Widget child,
      ProductsModel model) { //1
          return _buildProductList(model.products); 
           //lui products i-am facut eu getter cand am definit ProductsModel

          //1 al treilea era argument era de type Model, 
          // dar am pus ProductsModel definit de mine, care inherits from Model, 
          // deci e ok si e fix ce-mi trebe mie
      },
      );
  }
}
