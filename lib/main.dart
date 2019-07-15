import 'package:flutter/material.dart';
import 'package:member_app/pages/home_page.dart';
import 'package:member_app/pages/login_page.dart';
import 'package:member_app/pages/profile_page.dart';
import 'package:member_app/pages/register_page.dart';
import 'package:member_app/pages/workshop_detail_page.dart';
import 'package:member_app/pages/workshop_page.dart';

void main() => runApp(MemberApp());

class MemberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mushroom Cloud MakerSpace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilePage(),
        '/workshop': (context) => WorkshopPage(),
        '/workshtop_detail': (context) => WorkshopDetailPage()
      },
    );
  }
}
