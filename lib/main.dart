import 'package:babylock/playlist.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'BabyLock'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height / 1.3;
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main/main_inactivation.jpg'),
            fit: BoxFit.cover
          )
        ),

        child: Container(
          height: deviceHeight,
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: GridView.count(
          primary: false,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          
          children: <Widget>[
            FlatButton(
              child: Image.asset('assets/main/main_screenlock.png'),
              onPressed: null,
            ),
            FlatButton(
              child: Image.asset('assets/main/main_unlockalert.png'),
              onPressed: null,
            ),
            FlatButton(
              child: Image.asset('assets/main/main_playlist.png'),
              onPressed: () {
              },
            ),
            FlatButton(
              child: Image.asset('assets/main/main_bluelight.png'),
              onPressed: null,
            ),
            FlatButton(
              child: Image.asset('assets/main/main_tutorial.png'),
              onPressed: null,
            )
          ],
          ),
        ),
      ),
    );
  }
}
