import 'package:flutter/material.dart';
import 'package:member_app/styles/common_styles.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _repwdController = new TextEditingController();
  TextEditingController _pnController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

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
      body: Center(
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
                    "用户注册",
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
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: Form(
                          key: _formKey,
                          autovalidate: false,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _pnController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  labelText: "手机号",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                ),
                                validator: (v) {
                                  return v.trim().length == 11
                                      ? null
                                      : "请输入有效的手机号";
                                },
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                  controller: _pwdController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    labelText: "密码",
                                    hintText: "请输入至少6位密码",
                                  ),
                                  obscureText: true,
                                  validator: (v) {
                                    return v.trim().length > 5
                                        ? null
                                        : "密码不能少于6位";
                                  }),
                              SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                  controller: _repwdController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    labelText: "再次输入密码",
                                  ),
                                  obscureText: true,
                                  validator: (_) {
                                    if (_repwdController.text !=
                                        _pwdController.text) {
                                      return "两次输入的密码不同";
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60, left: 60),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: RaisedButton(
                            child: Text("提交", style: buttonTextStyle),
                            elevation: 3,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            onPressed: () {
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                showDialog<Null>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return new AlertDialog(
                                      title: new Text(
                                        '恭喜注册成功',
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Text(
                                        '请登录账号并修改个人信息',
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('确定'),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/login');
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ).then((val) {
                                  print(val);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
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
