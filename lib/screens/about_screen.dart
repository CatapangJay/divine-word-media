import 'package:flutter/material.dart';
import '../presentation/social_media_icons.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        elevation: 0.1,
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    "Divine Word Media",
                    style:
                        TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
                  ),
                  new Text("Because the WORD of God gives life"),
                  new Text(
                    "\nLorem ipsum dolor sit amet, consectetur adipiscing\n"
                    "elit, sed do eiusmod tempor incididunt ut labore et dolore\n"
                    "magna aliqua. Ut enim ad minim veniam, quis nostrud\n"
                    "exercitation ullamco laboris nisi ut aliquip.\n",
                    textAlign: TextAlign.center,
                  ),
                  new Divider(),
                  new ListTile(
                    leading: Icon(SocialMedia.instagram),
                    title: Text('Follow us on Instagram'),
                    onTap: () {},
                  ),
                  new ListTile(
                    leading: Icon(SocialMedia.facebook_official),
                    title: Text('Follow us on Facebook'),
                    onTap: () {},
                  ),
                  new ListTile(
                    leading: Icon(SocialMedia.twitter),
                    title: Text('Follow us on Twitter'),
                    onTap: () {},
                  ),
                  new ListTile(
                    leading: Icon(SocialMedia.youtube_play),
                    title: Text('Subscribe to us on Youtube'),
                    onTap: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
