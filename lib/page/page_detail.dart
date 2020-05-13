import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  final List<Data> dataList;
  PageDetail({
    Key key,
    this.dataList,
  }) : super(key: key);

  @override
  PageDetailState createState() => PageDetailState();
}

class PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Center(
        child: Text('Comming soon...'),
      ),
    );
  }
}

class Data {
  final int id;
  bool expanded;
  final String title;
  Data(this.id, this.expanded, this.title);
}