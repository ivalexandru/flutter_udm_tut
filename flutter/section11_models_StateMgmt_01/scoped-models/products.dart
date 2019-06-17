import "package:scoped_model/scoped_model.dart";
import "../models/product.dart"; 

class ProductsModel extends Model{

  List<Product> _products = [];

//pt ca vreau ca _products sa nu fie accesat de afara, dar vreau sa accesez produsele..
//create a getter to be able to access products with the dot notation(as a property)
//if you use a get keyword, you must NOT use a parameter list
  List<Product> get products{
    //return a new copy of that list
    //altfel ar fi fost doar o referinta catre aceeasi lista
    //amu daca editam aceasta lista noua, nu editam si lista originala
    return List.from(_products);
  }

//acest model / type il pasez si ca parametru metodelor care este
  void addProduct(Product product) {

//metodele nu mai sunt _private pt ca vor fi called from outside this file
      _products.add(product);
  }

  void updateProduct(int index, Product product){
      _products[index] = product;   
  }

  void deleteProduct(int index) {
      _products.removeAt(index);
  }

}