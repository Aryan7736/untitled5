import 'package:flutter/foundation.dart';

import '../model/Products.dart';
import 'apiservice.dart';

class ProductProvider with ChangeNotifier {
  List<Products> _products = [];
  ApiService apiService=ApiService();
  bool _isloading=false;

  bool get isloading => _isloading;

  List<Products> get products => _products;

  // Add a method to load products from JSON
void loaddata() async {
  change_loading();
  var data=await  apiService.fetchProducts();
  print("load data${data!.length}");

    _products=data!;
    notifyListeners();
    change_loading();


  print("load data _products${_products!.length}");
}
void change_loading(){
  _isloading=!_isloading;
  notifyListeners();
}
}
