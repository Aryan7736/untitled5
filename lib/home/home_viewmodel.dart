




import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../model/Products.dart';
import '../webservice/productprovider.dart';

class HomeViewModel extends BaseViewModel {
  var provider;
  init(BuildContext context){
    print("init provider");
    provider = Provider.of<ProductProvider>(context);
    fetch();
  }

  List<Products> _products = [];

  bool get loading => _loading;
  bool _loading=false;


  List<Products> get products => _products;

  fetch()  {
   print("try to call api");
   provider.loaddata();
   _loading=provider.isloading;
   notifyListeners();
 }

  Future<void> setdata() async {
    var s=provider.products;
    print("p length${s.length}");
    _products=await provider.products;
    notifyListeners();
    print("_p length${_products.length}");
    _loading=provider.isloading;
    notifyListeners();
  }
  }
