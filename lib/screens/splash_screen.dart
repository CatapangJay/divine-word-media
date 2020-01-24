
import 'package:divine_word_app/main.dart';
//import 'package:divine_word_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
runApp(
  MaterialApp(
    home:SplashScreen()
  ),
);
}

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State <SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(
      seconds: 3),
      (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DivineWordApp();
        } ));
      }
      );
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Expanded(
               flex: 0,
               child: Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Image(
                       image: AssetImage('assets/images/DIVINEWORD.png'),
                     ),
                   ],
                 ),
               ),
             ),
             Expanded(
               flex: 1,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   CircularProgressIndicator(
                    
                   ),
                   Padding(padding: EdgeInsets.only(top:20),)
                 ],
               ),
             ),
           ],
         ),
        ],
      ),
    );
  }
}