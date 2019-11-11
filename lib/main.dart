import 'package:flutter/material.dart';
import 'package:demo/home_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DemoApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff7e57c2),
            primaryColorLight: Color(0xffb085f5),
            primaryColorDark: Color(0xff4d2c91),
            accentColor: Color(0xffab47bc)),
        home: HomePage());
  }
}
