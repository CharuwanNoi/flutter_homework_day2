import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  final List<Data> dataList;
  PageOne({
    Key key,
    this.dataList,
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {
  List<String> items = ["AA", "BB", "CC", "DD", "EE", "FF", "GG", "HH"];
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: items.map((item) {
          return Card(
              child: Column(children: [
            ListTile(
              title: Text(item, style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text("12345"),
              leading: null,
            ),
            SwitchListTile(
              title: null,
              value: _lights,
              onChanged: (bool value) {
                // setState(() {
                //   _lights = value;
                // });
              },
              secondary: const Icon(Icons.lightbulb_outline),
            ),
          ]));
        }).toList(),
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
