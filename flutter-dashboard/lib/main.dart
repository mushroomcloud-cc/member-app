import 'package:flutter/material.dart';
import 'package:flutter_dashboard/ui/pages/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '蘑菇云创客空间',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
