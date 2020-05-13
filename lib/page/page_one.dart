import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import './page_detail.dart';
import 'package:http/http.dart' as http;
import '../models/transaction.dart';

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
 List<Transaction> _transactions = [];
  bool _lights = false;

  // void _detailPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => PageDetail()),
  //   );
  // }

  void _getdata() {
    http
        .get('https://labflutter-3b9e2.firebaseio.com/sensor.json')
        .then((response) {
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Transaction> transaction = [];
      extractedData.forEach((prodId, prodData) {
        print(prodData);
        transaction.add(Transaction(
            description: prodData['description'],
            title: prodData['title'],
            id: prodData['id']));
        print(transaction);

        setState(() {
          this._transactions = transaction;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Text(
              'Please click to download.',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          RaisedButton(
            onPressed: _getdata,
            child: Text('Load data', style: TextStyle(fontSize: 20)),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: _transactions.map((item) {
              return InkWell(
                  onTap: _getdata,
                  child: Card(
                      child: Column(children: [
                    ListTile(
                      title: Text(item.description,
                          style: TextStyle(fontWeight: FontWeight.w500)),
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
                  ])));
            }).toList(),
          ),
        ],
      )),
    );
  }
}

class Data {
  final int id;
  bool expanded;
  final String title;
  Data(this.id, this.expanded, this.title);
}
