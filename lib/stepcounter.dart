import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

void main() {
  runApp(StepCounterApp());
}

class StepCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StepCounterPage(),
    );
  }
}

class StepCounterPage extends StatefulWidget {
  @override
  _StepCounterPageState createState() => _StepCounterPageState();
}

class _StepCounterPageState extends State<StepCounterPage> {
  int stepCount = 0;
  Pedometer? _pedometer;
  StreamSubscription<int>? _subscription;

  @override
  void initState() {
    super.initState();

    _pedometer = Pedometer();

    _subscription = Pedometer.stepCountStream.listen((event) {
      setState(() {
        stepCount = event as int;
      });
    }) as StreamSubscription<int>?;
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Your Steps'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Step Count',
              style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
            ),
            Text(
              stepCount.toString(),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
