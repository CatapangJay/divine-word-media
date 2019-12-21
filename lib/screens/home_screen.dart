import 'package:divine_word_app/models/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;
  final firestore = Firestore.instance;
  List<DocumentSnapshot> articles = [];
  List<Article> articles2 = [];
  bool isLoading = false; // track if products fetching
  bool hasMore = true; // flag for more products available or not
  int documentLimit = 10; // documents to be fetched per request
  DocumentSnapshot
      lastDocument; // flag for last document from where next 10 records to be fetched
  ScrollController _scrollController =
      ScrollController(); // listener for listview scrolling

  @override
  void initState() {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        getArticles();
      }
    });
    super.initState();
    this.getArticles();
  }

  Future getArticles() async {
    if (!hasMore) {
      print('No More Products');
      return;
    }
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      querySnapshot = await firestore
          .collection('articles')
          .limit(documentLimit)
          .getDocuments();
    } else {
      querySnapshot = await firestore
          .collection('articles')
          .startAfterDocument(lastDocument)
          .limit(documentLimit)
          .getDocuments();
    }

    if (querySnapshot.documents.length < documentLimit) {
      hasMore = false;
    }

    lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    articles.addAll(querySnapshot.documents);
    for (var article in articles) {
      print(article.data);
    }

    setState(() {
      isLoading = false;
    });
  }

  Card createCard(DocumentSnapshot article) {
    print('Card on Create');
    print(article['imageurl']);
    return new Card(
      elevation: 1.7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: new Column(
        children: <Widget>[
          new SizedBox(
            width: double.infinity,
            height: 180.0,
            child: new Image.network(
              article['imageurl'],
              fit: BoxFit.cover,
            ),
          ),
          new SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                article['header'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          new SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: new Text(
                article['body'],
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 3,
              ),
            ),
          ),
          new Expanded(
              child: new Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                  child: new Text(
                    article['author'],
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
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
                    padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                    child: new Icon(
                      Icons.share,
                    )),
              )
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          children: <Widget>[
            new Expanded(
              child: isLoading
                  ? const Center(child: const CircularProgressIndicator())
                  : articles.length != 0
                      ? new ListView.builder(
                          itemCount: articles.length,
                          padding: new EdgeInsets.all(8.0),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 330.0,
                                child: createCard(articles[index]));
                          })
                      : new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new Icon(Icons.chrome_reader_mode,
                                    color: Colors.grey, size: 60),
                                new Text(
                                  "No articles available",
                                  style: new TextStyle(
                                      fontSize: 15.0, color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
