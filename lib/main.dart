import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:untitled5/app/app.locator.dart';
import 'package:untitled5/login/login_view.dart';
import 'package:untitled5/webservice/productprovider.dart';

import 'app/app.router.dart';
import 'home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,

    );
  }
}


