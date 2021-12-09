import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_aap/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: DefaultTabController(initialIndex: 0, length: 6, child: Home()),
    );
  }
}
