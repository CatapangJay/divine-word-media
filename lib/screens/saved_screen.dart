import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
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
                new Icon(Icons.bookmark, color: Colors.grey, size: 60),
                new Text(
                  "No items available",
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
