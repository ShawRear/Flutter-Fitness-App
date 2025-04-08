import 'package:flutter/material.dart';
import 'dart:async';

class CalorieSpendPage extends StatefulWidget {
  const CalorieSpendPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalorieSpendPageState createState() => _CalorieSpendPageState();
}

class _CalorieSpendPageState extends State<CalorieSpendPage> {
  double calorieExpenditure = 0;
  bool isTiming = false;
  int durationInSeconds = 0;
  late Timer _timer;

  // Function to start the timer
  void startTimer() {
    isTiming = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        durationInSeconds++;
      });
    });
  }

  // Function to stop the timer and calculate calorie expenditure
  void stopTimer() {
    if (isTiming) {
      _timer.cancel();
      isTiming = false;

      // Calorie expenditure formula (you can replace this with your own formula)
      double caloriesPerMinute = 5; // Example value, adjust as needed
      calorieExpenditure = (durationInSeconds / 60) * caloriesPerMinute;

      setState(() {});
    }
  }

  @override
  void dispose() {
    if (isTiming) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Expenditure'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Activity Duration: ${Duration(seconds: durationInSeconds).toString()}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                if (!isTiming) {
                  startTimer();
                } else {
                  stopTimer();
                }
              },
              child: Text(isTiming ? 'Stop' : 'Start'),
            ),
            const SizedBox(height: 20),
            Text(
              'Calorie Expenditure: ${calorieExpenditure.toStringAsFixed(2)} calories',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
