import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Article {
  final String id;
  final String header;
  final String subHeader;
  final String body;
  final String imageUrl;
  final String author;

  const Article(
      {this.id,
      this.header,
      this.subHeader,
      this.body,
      this.imageUrl,
      this.author});

  Article.fromMap(Map<String, dynamic> data, String id)
      : this(
            id: id,
            header: data['header'],
            body: data['body'],
            imageUrl: data['imageurl'],
            author: data['author']);
}
