import 'package:flutter/material.dart';

class Project {
  final String id;
  final String title;
  final DateTime date;
  final String user;
  bool invoiceExtractor;
  bool spendClassifier;
  bool reporter;

  Project({
    @required this.id, 
    @required this.title, 
    @required this.user, 
    @required this.date, 
    @required this.invoiceExtractor, 
    @required this.spendClassifier, 
    @required this.reporter});
}

