import 'package:flutter/material.dart';

class Transaction {
  IconData icon;
  String title;
  String from;
  String value;
  String method;
  String date;

  Transaction(
      this.icon, this.title, this.from, this.value, this.method, this.date);
}
