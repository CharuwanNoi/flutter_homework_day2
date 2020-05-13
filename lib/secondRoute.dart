import 'package:flutter/material.dart';


import './page/page_one.dart';
import './page/page_two.dart';
import './page/page_three.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final Key keyOne = PageStorageKey('pageOne');
  final Key keyTwo = PageStorageKey('pageTwo');
  final Key keyThree = PageStorageKey('pageThree');

  int currentTab = 0;

  PageOne one;
  PageTwo two;
  PageThree three;
  List<Widget> pages;
  Widget currentPage;

  List<Data> dataList;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    dataList = [
      Data(1, false, "Example-1"),
      Data(2, false, "Example-2"),
      Data(3, false, "Example-3"),
      Data(4, false, "Example-4"),
      Data(5, false, "Example-5"),
      Data(6, false, "Example-6"),
      Data(7, false, "Example-7"),
      Data(8, false, "Example-8"),
      Data(9, false, "Example-9"),
      Data(10, false, "Example-10"),
    ];
    one = PageOne(
      key: keyOne,
    );

    two = PageTwo(
      key: keyTwo,
    );

    three = PageThree(
      key: keyThree,
    );

    pages = [one, two, three];

    currentPage = one;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Control"),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Sensor'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text("Controller"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Account"),
          ),
        ],
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


