import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Test'),
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
  Color color = Colors.white;

  _generateColor() {
    Color tmp =
        Color((new Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    setState(() {
      color = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
          child: Center(
            child: Column(
              children: <Widget>[
                new InkWell(
                  child: new GestureDetector(
                    onTap: () {
                      _generateColor();
                      print("Tapped");
                    },
                    child: new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.875,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: color,
                          width: 0.1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'hello there',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.black54,
                              backgroundColor: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )),
    );
  }
}
