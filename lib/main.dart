

import 'package:adminportalcitizen/screens/HomeScreen.dart';
import 'package:adminportalcitizen/screens/HomeScreenDesign.dart';
import 'package:adminportalcitizen/screens/login2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:  Login(),
    );
  }
}
