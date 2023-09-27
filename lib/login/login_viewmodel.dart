




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled5/app/app.router.dart';
import 'package:untitled5/home/home_view.dart';

import '../app/utils.dart';
import '../model/Products.dart';
import '../webservice/productprovider.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController  namectrlr=TextEditingController();
  TextEditingController pwdctrlr=TextEditingController();
  void Login(){
    print(namectrlr.text.toString());
    navigationService.navigateTo(Routes.loginView);
  }
void init(){}
  }
