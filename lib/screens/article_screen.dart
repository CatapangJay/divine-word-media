import 'package:flutter/material.dart';
import 'package:divine_word_app/models/article.dart';

class ArticleScreen extends StatelessWidget {
  Article _article;

  ArticleScreen({Article article}) {
    article = article;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[200],
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(_article.imageUrl))),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                        child: new Icon(Icons.bookmark_border),
                      ),
                    ),
                    new GestureDetector(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 7.0, right: 10.0),
                          child: new Icon(
                            Icons.bookmark_border,
                          )),
                    ),
                    new GestureDetector(
                      child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 8.0),
                          child: new Icon(
                            Icons.share,
                          )),
                    )
                  ],
                ),

//                child: new Stack(
//                  children: <Widget>[
//                    new Positioned(
//                        top: 0.0, left: 0.0, child: new Icon(Icons.close)),
//                    new Positioned(
//                        top: 0.0,
//                        right: 0.0,
//                        child: new Icon(Icons.bookmark_border)),,
//                    new Positioned(
//                        top: 0.0,
//                        right: 0.0,
//                        child: new Icon(Icons.bookmark_border)),
//                  ],
//                ),
              ),
              new Text(_article.header),
              new Text(_article.author),
              new Text(_article.body)
            ],
          ),
        ));
  }
}
