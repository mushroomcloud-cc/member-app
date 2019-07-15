import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Theme.of(context).canvasColor,
       ),
       body: Center(
         child: Text("Mushroom Cloud Makerspace"),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: (){

         },
         child: Icon(Icons.select_all),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: BottomAppBar(
         shape: CircularNotchedRectangle(),
         child: Container(
           height: 30,
         ),
       ),
    );
  }
}