import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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
                new Icon(Icons.shopping_basket, color: Colors.grey, size: 60),
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
