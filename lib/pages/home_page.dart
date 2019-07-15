import 'dart:convert';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:member_app/constants/app_constants.dart';
import 'package:member_app/models/user.dart';
import 'package:member_app/styles/common_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Hero(
                tag: "main-logo",
                child: SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Hero(
                tag: "sub-title",
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("蘑菇云创客空间"),
                ),
              ),
              SizedBox(
                height: 72,
              ),
              if (_loading) _buildLoadingWidget(context),
              if (!_loading) _buildButtonColumn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return SpinKitThreeBounce(
      color: Colors.grey,
      size: 50,
    );
  }

  Column _buildButtonColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 60.0, right: 60.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(32.0),
            color: Colors.white,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              minWidth: MediaQuery.of(context).size.width,
              child: Text(
                '登录',
                style: buttonTextStyle,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60.0, right: 60.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(32.0),
            color: Colors.white,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              minWidth: MediaQuery.of(context).size.width,
              child: Text(
                '注册',
                style: buttonTextStyle,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    var prefs = await _prefs;
    var json = prefs.getString(prefsUser);

    try {
      User _user = User.fromJson(jsonDecode(json));
      var jsonStr = jsonEncode(_user);
      print('saved user: $jsonStr');
      if (_user != null) {
        // TODO: valid token from server
        // TODO: update provider

        Navigator.pushNamed(context, '/workshop');
        return;
      }
    } catch (err) {
      print('json decode error: $err');
    }
    setState(() {
      _loading = false;
    });
  }
}
