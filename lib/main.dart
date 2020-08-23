import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StopWatchPage()
    );
  }
}

class StopWatchPage extends StatefulWidget {
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer _timer;
  var _time = 0;
  var _isRunning = false;

  List<String> _lapTimes = [];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatch'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _clickButton();
        },),
        backgroundColor: Colors.blue,
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '0',
                      style: TextStyle(fontSize: 50.0),
                    ),
                    Text('00'),
                  ],
                ),
                Container(
                  width: 100,
                  height: 200,
                  child:ListView(
                    children: <Widget>[],
                  ),
                )
              ],
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                onPressed: () {},
                child: Icon(Icons.rotate_left),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: RaisedButton(
                onPressed: () {},
                child: Text('랩타임'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _clickButton() {
    _isRunning = !_isRunning;

    if(_isRunning) {
      _start();
    } else {
      _pause();
    }
  }
}
