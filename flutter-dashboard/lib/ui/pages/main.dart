import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: Text('蘑菇云创客空间'),
         ),
         body: Center(
           child: Text('under construction'),
         ),
       ),
    );
  }
}