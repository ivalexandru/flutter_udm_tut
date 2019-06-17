import "package:flutter/material.dart";

//final because only assigned once
//when we edit a product, we create a new product and replace the old one
class Product {
  final String title;
  final String description;
  final double price;
  final String image;

  Product(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.image});
}
