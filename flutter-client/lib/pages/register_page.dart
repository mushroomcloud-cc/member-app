import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  TextEditingController _unameController =new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                  
                    TextFormField(
                      autofocus: true,
                      controller: _unameController,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "请输入用户名",
                        icon: Icon(Icons.person)
                      ),
                      validator: (v){
                        return v
                            .trim()
                            .length >0?null :"用户名不能为空";
                      },
                    ),
                    TextFormField(
                      controller: _pwdController,
                      decoration:InputDecoration(
                        labelText: "密码",
                        hintText: "请输入密码",
                        icon: Icon(Icons.lock)
                      ),
                      obscureText: true,
                      validator: (v){
                        return v
                            .trim()
                            .length >5? null :"密码不能少于6位";
                      }
                    ),
                  ],
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child:Row(
                 children: <Widget>[
                   Expanded(
                     child: RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                         child: Text("提交"),
                         color:Theme
                              .of(context)
                              .primaryColor,
                         textColor: Colors.white,
                         onPressed:(){
                           if((_formKey.currentState as FormState).validate())
                           {

                           }
                         },
                     ),
                   )
                 ],
               ) 
             ),
          ],
        ),
      ),
    );
  }
}
