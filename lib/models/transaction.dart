import 'package:flutter/foundation.dart';

class Transaction {
  final int id;
  final String title;
  final String description;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.description});
}
