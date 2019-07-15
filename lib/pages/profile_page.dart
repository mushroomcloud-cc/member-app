import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<bool> _onWillPop() {
    Navigator.of(context).pushReplacementNamed('/workshop');
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
          iconTheme: IconThemeData(
            color: Colors.grey, //change your color here
          ),
        ),
        body: Center(
          child: Text('Profile'),
        ),
      ),
    );
  }
}
