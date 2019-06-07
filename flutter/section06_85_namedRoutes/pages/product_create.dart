import 'package:flutter/material.dart';
//1 aici nu returnam Scaffold, AppBar

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Save"),
        onPressed: () {
//1
          showModalBottomSheet(context: context, builder: (BuildContext context) {
            return Center(child: Text("salam"),);
          } );
        },
      ),
    );
  }
}
//1 slides up a sheet from the bottom of the page, into which you can put additional information or actions

