import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;
  final _firestore = Firestore.instance;

  void getArticles() async{
    final articles = await _firestore.collection('articles').getDocuments();
    for(var article in articles.documents){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Icon(Icons.chrome_reader_mode,
                    color: Colors.grey, size: 60),
                new Text(
                  "No articles available",
                  style: new TextStyle(fontSize: 15.0, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
