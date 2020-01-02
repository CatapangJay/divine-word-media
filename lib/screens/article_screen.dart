import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:divine_word_app/models/article.dart';

class ArticleScreen extends StatelessWidget {
  Article _article;

  ArticleScreen(Article article) {
    _article = article;
  }

  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          actions: <Widget>[
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
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 7.0, right: 10.0),
                  child: new Icon(
                    Icons.share,
                  )),
            ),
          ],
          backgroundColor: Colors.green,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: new Image.network(
              _article.imageUrl, fit: BoxFit.cover,),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
              [
                new Text(_article.header),
                new Text(_article.author),
                new Text(_article.body)
              ]
          ),
        )
      ],
    );
  }
}
