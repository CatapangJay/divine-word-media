import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String id;
  final String header;
  final String subHeader;
  final String body;
  final String imageUrl;
  final String author;
  final Timestamp publishDate;

  const Article(
      {this.id,
      this.header,
      this.subHeader,
      this.body,
      this.imageUrl,
      this.author,
      this.publishDate});

  factory Article.fromDocument(DocumentSnapshot document) {
    return Article(
        id: document.documentID,
        header: document['header'],
        body: document['body'],
        imageUrl: document['imageurl'],
        author: document['author'],
        publishDate: document['publishdate']);
  }
}
