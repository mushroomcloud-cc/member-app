import 'package:flutter/material.dart';
import 'package:member_app/pages/home_page.dart';
import 'package:member_app/pages/login_page.dart';
import 'package:member_app/pages/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mushroom Cloud MakerSpace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/login': (_) => LoginPage(),
        '/profile': (_) => ProfilePage()
      },
    );
  }
}

