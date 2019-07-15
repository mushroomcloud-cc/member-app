import 'package:flutter/material.dart';
import 'package:member_app/styles/common_styles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
          ),
        ),
      ),
    );
  }
}
