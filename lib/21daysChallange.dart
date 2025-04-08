import 'package:flutter/material.dart';

void main() {
  runApp(ChallengeApp());
}

class ChallengeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChallengePage(),
    );
  }
}

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  List<String> tasks = [
    "Day 1: Push-ups, Sit-ups, Jumping Jacks",
    "Day 2: Lunges, Plank, High Knees",
    "Day 3: Squats, Bicycle Crunches, Mountain Climbers",
    "Day 4: Push-ups, Sit-ups, Jumping Jacks",
    "Day 5: Lunges, Plank, High Knees",
    "Day 6: Squats, Bicycle Crunches, Mountain Climbers",
    "Day 7: Push-ups, Sit-ups, Jumping Jacks",
    "Day 8: Lunges, Plank, High Knees",
    "Day 9: Squats, Bicycle Crunches, Mountain Climbers",
    "Day 10: Push-ups, Sit-ups, Jumping Jacks",
    "Day 11: Lunges, Plank, High Knees",
    "Day 12: Squats, Bicycle Crunches, Mountain Climbers",
    "Day 13: Push-ups, Sit-ups, Jumping Jacks",
    "Day 14: Lunges, Plank, High Knees",
    "Day 15: Squats, Bicycle Crunches, Mountain Climbers",
    "Day 16: Push-ups, Sit-ups, Jumping Jacks",
    "Day 17: Lunges, Plank, High Knees",
    "Day 18: Squats, Bicycle Crunches, Mountain Climbers",
    "Day 19: Push-ups, Sit-ups, Jumping Jacks",
    "Day 20: Lunges, Plank, High Knees",
    "Day 21: Squats, Bicycle Crunches, Mountain Climbers",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('21 Days Challenge', style: TextStyle(fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf'),),
        backgroundColor: Colors.purple, // Set the app bar color to purple
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card( // Use Card widget for a box design
            elevation: 4, // Add a shadow to the card
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add margin
            child: ListTile(
              title: Text(
                tasks[index],
                style: const TextStyle(
                  color: Colors.black, // Text color
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf'// Bold text
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  // Handle task completion logic here
                  setState(() {
                    tasks[index] = tasks[index] + ' (Completed)';
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
