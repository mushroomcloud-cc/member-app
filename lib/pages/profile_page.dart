import 'dart:io';

import 'package:flutter/material.dart';
import 'package:member_app/models/user.dart';
import 'package:member_app/styles/common_styles.dart';

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
          backgroundColor: Colors.blue[500],
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(32)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue[500], Colors.blue[100]]),
                  ),
                  child: null,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: Hero(
                    tag: 'user-avatar',
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: new BoxDecoration(
                        color: const Color(0xFFFFFFFF), // border color
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage(defaultUser.avatar),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text(defaultUser.nickname,style: TextStyle(fontSize: 20),),
            ),

            Expanded(
              flex: 1,
                          child: Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.local_activity),
                        title: Text('参加活动次数'),
                        trailing: Text('4'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text('会员到期时间'),
                        trailing: Text('2019年8月10日'),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                   Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0,bottom: 32.0),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(32.0),
                      color: Colors.white,
                      child: MaterialButton(
                        onPressed: () {
                          exit(0);
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        child: Text(
                          '退出',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
