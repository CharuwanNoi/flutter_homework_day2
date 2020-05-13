import 'package:flutter/material.dart';
import './secondRoute.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondRoute()),
    );
    // http
    //     .get('https://labflutter-3b9e2.firebaseio.com/user.json')
    //     .then((value) {
    //       // print("##object");
    //       print(value.body);
    //       });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: null,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Text(
                  'Singin',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 10.0, bottom: 5.0, right: 16.0, left: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, bottom: 20.0, right: 16.0, left: 16.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: RaisedButton(
                  onPressed: _login,
                  child: Text('Login', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
