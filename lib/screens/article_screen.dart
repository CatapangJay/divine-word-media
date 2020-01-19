import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:divine_word_app/models/article.dart';
import 'package:flutter/rendering.dart';

class ArticleScreen extends StatefulWidget {
  Article _article;
  ArticleScreen(Article article) {
    _article = article;
  }

  @override
  _ArticleScreenState createState() => _ArticleScreenState(_article);
}

class _ArticleScreenState extends State<ArticleScreen> {
  Article _article;

  _ArticleScreenState(Article article) {
    _article = article;
  }

  ScrollController _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          iconTheme:
              IconThemeData(color: isShrink ? Colors.black : Colors.white),
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
          backgroundColor: Theme.of(context).appBarTheme.color,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: new Image.network(
              _article.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Card(
              margin: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 3.0),
                    child: new Text(
                      _article.header,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  new Text(_article.author),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: new Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                    child: new Text(
                      _article.body.replaceAll("\\n", "\n"),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }
}
