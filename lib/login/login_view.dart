import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<LoginViewModel>.reactive(

        viewModelBuilder: ()=>LoginViewModel(),
        onViewModelReady: (model){
          model.init();
        },
        builder:( context,model,child){
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                TextFormField(
                  controller: model.namectrlr,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                )  , TextFormField(
                  obscureText: true,
                  controller: model.pwdctrlr,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                ElevatedButton(onPressed: (){
                  model.Login();
                }, child: Text('Login'))

              ],
            ),

          );
        });
  }
}


