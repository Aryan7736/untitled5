import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/webservice/productprovider.dart';

import 'home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(create: (context) => ProductProvider(),
        child: HomeView(),
      ),
    );
  }
}


