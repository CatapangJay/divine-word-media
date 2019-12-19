import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Article {
  final String id;
  final String header;
  final String subHeader;
  final String body;
  final String imageUrl;

  Article({this.id, this.header, this.subHeader, this.body, this.imageUrl});
}
