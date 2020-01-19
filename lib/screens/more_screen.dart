import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Card(
        elevation: 0.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        shape: ContinuousRectangleBorder(),
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
            ),
            new ListTile(leading: Icon(Icons.settings), title: Text("Settings"))
          ],
        ),
      ),
    );
  }
}
