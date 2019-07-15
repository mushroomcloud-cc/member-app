import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:member_app/models/workshop.dart';


class WorkshopPage extends StatefulWidget {
  WorkshopPage({Key key}) : super(key: key);

  _WorkshopPageState createState() => _WorkshopPageState();
}

class _WorkshopPageState extends State<WorkshopPage> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('提示'),
              content: new Text('是否退出程序'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('否'),
                ),
                new FlatButton(
                  onPressed: () => exit(0),
                  child: new Text('是'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                  icon: Icon(Icons.person, color: Colors.grey)),
            )
          ],
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              ...workshopItems.map((Workshop item) {
                return Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: CachedNetworkImage(
                          imageUrl: item.cover,
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text(item.description),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
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
      ),
    );
  }
}
