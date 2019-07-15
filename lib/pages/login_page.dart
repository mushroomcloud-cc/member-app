import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:member_app/constants/app_constants.dart';
import 'package:member_app/models/user.dart';
import 'package:member_app/services/api_service.dart';
import 'package:member_app/styles/common_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _service = ApiService();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _loading = false;

  void _saveUser(User user) async {
    var ins = await _prefs;
    ins.setString(prefsUser, jsonEncode(user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Hero(
                  tag: "main-logo",
                  child: SizedBox(
                    height: 80,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "用户登录",
                    style: TextStyle(letterSpacing: 8.0),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 60.0, right: 60.0, bottom: 32.0),
                        child: TextField(
                          controller: _userController,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "用户名",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 60.0, right: 60.0, bottom: 32.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "密码",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(32.0),
                          color: Colors.white,
                          child: MaterialButton(
                            onPressed: () {
                              var user = _userController.text;
                              var pass = _passwordController.text;
                              if (user == null || user.isEmpty) {
                                Fluttertoast.showToast(msg: '请输入用户名');
                                return;
                              }
                              if (pass == null || pass.isEmpty) {
                                Fluttertoast.showToast(msg: '请输入密码');
                                return;
                              }
                              User loginUser = User();
                              loginUser.username = user;
                              loginUser.password = pass;

                              setState(() {
                                _loading = true;
                              });

                              _service
                                  .login(loginUser)
                                  .then((User _user) async {
                                print('login: ${_user.token}');
                                await _saveUser(_user);
                                Navigator.of(context)
                                    .pushReplacementNamed('/workshop');
                              }).catchError((err) {
                                print('err: $err');

                                Fluttertoast.showToast(msg: '错误: $err');
                              }).whenComplete(() {
                                setState(() {
                                  _loading = false;
                                });
                              });
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              '登录',
                              style: buttonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_loading)
                    Center(
                      child: SpinKitThreeBounce(
                        color: Colors.grey,
                        size: 50.0,
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
