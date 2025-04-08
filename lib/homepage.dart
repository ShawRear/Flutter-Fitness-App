import 'remindersPage.dart';
import 'calorie_spend.dart';
import 'walkingTrackerPage.dart';
import 'package:flutter/material.dart';
import '21daysChallange.dart';
import 'bmiCalculatorPage.dart';
import 'dailyGoalsPage.dart';
import 'homeWorkoutTutorials.dart';

void main() {
  runApp(const FitnessApp());
}
class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FitnessHomePage(),
    );
  }
}

class FitnessHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,

        title: const Text('Fitness App', style: TextStyle(fontFamily: "OpenSans-VariableFont_wdth,wght"),),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle the menu icon action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CalorieSpendPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_walk,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Calorie Meter',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                        Text(
                          'Burn Calories!',
                          style: TextStyle(color: Colors.white, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMICalculator()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      children: <Widget>[
                        Icon(
                          Icons.local_dining,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'BMI calculator',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                        Text(
                          'Overweight',
                          style: TextStyle(color: Colors.white, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Add navigation for Daily Goals Page

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TodoListPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      children: <Widget>[
                        Icon(
                          Icons.list,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Daily Goals',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                        Text(
                          '3 goals for today',
                          style: TextStyle(color: Colors.white, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add navigation for Walking Tracker Page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WalkingTrackerPage()));

                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      children: <Widget>[
                        Icon(
                          Icons.accessibility_new,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Walking Tracker',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                        Text(
                          '2 miles today',
                          style: TextStyle(color: Colors.white, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Add navigation for Home Workout Tutorials Page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));

                  },
                  child: Container(
                    width: 130,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      children: <Widget>[
                        Icon(
                          Icons.fitness_center,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Home Workout Tutorials',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                        Text(
                          'Daily workouts for you',
                          style: TextStyle(color: Colors.white, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add navigation for 21 Days Challenge Page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  ChallengeApp()));

                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '21 Days Challenge',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                        Text(
                          'Get fit in 21 days!',
                          style: TextStyle(color: Colors.white, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Add navigation for Reminders Page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RemindersPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  children: <Widget>[
                    Icon(
                      Icons.alarm,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Reminders',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                    ),
                    Text(
                      'Set your fitness reminders',
                      style: TextStyle(color: Colors.white, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// Add more page classes as needed
