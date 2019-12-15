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
  bool isLoading = false; // track if products fetching
  bool hasMore = true; // flag for more products available or not
  int documentLimit = 10; // documents to be fetched per request
  DocumentSnapshot lastDocument; // flag for last document from where next 10 records to be fetched
  ScrollController _scrollController = ScrollController(); // listener for listview scrolling

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


  void getArticles() async {
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
    }
    else {
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

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: Center(
        child: new Expanded(
          child: isLoading
              ? const Center(child: const CircularProgressIndicator())
              : articles.length != 0
                ? new ListView.builder(
                    itemCount: articles.length,
                    padding: new EdgeInsets.all(8.0),
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        elevation: 1.7,
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Column(
                            children: [
                              new Row(
                                children: <Widget>[],
                              )
                            ],
                          )
                        ),
                      );
                    }
                  ):
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Icon(Icons.chrome_reader_mode,
                      color: Colors.grey, size: 60),
                  new Text(
                    "No articles available",
                    style: new TextStyle(fontSize: 15.0, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


