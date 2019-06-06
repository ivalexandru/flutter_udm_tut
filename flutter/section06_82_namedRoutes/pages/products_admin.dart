import "package:flutter/material.dart";

//importi pagina unde vrei sa te duca onClick/onTap
import './products.dart';
import './product_create.dart';
import './product_list.dart';

//2 if true, it automatically implies what the first icon should be (punea alea 3 linii orizont)
//3 pagina unde vrei sa te duca
//4 pushReplacement in loc de push pt ca nu vrei sa ai 'back' buttn

//5 DefaultTabController wraps the Scaffold, pt ca face swap paginii cu totul.
//asta nu si adauga taburile, doar pregateste pagina pt a fi tab-controllable
//length :2 inseamna ca voi avea 2 taburi
//taburile le adaugi tu de mana, de obicei in AppBar (nu in AppBar-ul de la drawer
//ci in cel al paginii)


class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //5
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                Navigator.pushReplacementNamed(context, '/');//3
              },
            )
          ],
        )),
        appBar: AppBar(
          title: Text("mnge prods"),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              //7
                icon: Icon(Icons.create),
                text: "Create prod"),
            Tab(
                icon: Icon(Icons.list),
                text: "My prod"
                ),
          ],), //6
        ), //8
        body: TabBarView(
          children: <Widget>[
            //9
            ProductCreatePage(),
            ProductListPage(),
            //10
          ],
        ),
      ),
    );
  }
}
//6 will auto give us nicely styled tabs
//TabBar organizes them, Tab creates a single widget

//7 icon: e property; Icon e widget; Icons. e clasa predefinita
//by def, iconita apare deasupra textului

//8 pt ca pagina sa se schimbe cand selectam unul dt taburi,
// punem in body TabBarView(), altfel apesi degeaba pe ele

//9 nr de pagini pe care il bagi in children of the TabBarView()
//trebuie sa se potriveasca cu length: 2 de la DefaultTabController
// si cu nr de taburi pe care le-am pregatit. (nu uita ca tre sa le dai si import)
//nu uita sa instantiezi 'paginile'


//10 paginile de aici, the views that we swap here, in TabBarView,
// are embedded into the page, thy don't replace it.
//asa ca in oricare dt paginile pe care le swap-uiesc, ex ProductCreatePage,
//nu returnam un nou Scaffold, AppBar, drawer.. ci direct body-ul paginii.
