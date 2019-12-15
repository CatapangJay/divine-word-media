import 'package:flutter/material.dart';

class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
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
                new Icon(Icons.video_library, color: Colors.grey, size: 60),
                new Text(
                  "No videos available",
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
