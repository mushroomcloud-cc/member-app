import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _pnController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  bool _checkboxSelected = true;

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
            SizedBox(
              height: 60,
            ),
            Padding(
              //padding: const EdgeInsets.only(left: 30,right: 30),
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      controller: _unameController,
                      decoration: InputDecoration(
                        labelText: "姓名",
                        hintText: "请输入姓名",
                        //icon: Icon(Icons.person)
                      ),
                      validator: (v) {
                        return v.trim().length > 0 ? null : "姓名不能为空";
                      },
                    ),
                    TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "请输入密码",
                          //icon: Icon(Icons.lock)
                        ),
                        obscureText: true,
                        validator: (v) {
                          return v.trim().length > 5 ? null : "密码不能少于6位";
                        }),
                    TextFormField(
                      controller: _pnController,
                      decoration: InputDecoration(
                        labelText: "手机号",
                        hintText: "请输入手机号",
                        //icon: Icon(Icons.phone)
                      ),
                      validator: (v) {
                        return v.trim().length > 10 ? null : "请输入有效的手机号";
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 100, left: 100),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("提交"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            Navigator.pushNamed(context, '/login');
                          }
                        },
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
