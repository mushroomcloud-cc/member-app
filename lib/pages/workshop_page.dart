import 'package:flutter/material.dart';

class WorkshopPage extends StatefulWidget {
  WorkshopPage({Key key}) : super(key: key);

  _WorkshopPageState createState() => _WorkshopPageState();
}

class _WorkshopPageState extends State<WorkshopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: '请输入关键字', suffixIcon: Icon(Icons.search)),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/profile');
              },
              icon: Icon(Icons.person,color: Colors.grey)),
          )
        ],
      ),
      body: Center(
        child: Text('Workshop List'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          print('scanning');
        },
        child: Icon(
          Icons.crop_free,
          color: Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 38.0,
        ),
      ),
    );
  }
}
