import 'package:flutter/material.dart';

class StepCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step Counter Page', style: TextStyle(fontFamily: "OpenSans-VariableFont_wdth,wght")),
      ),
      body: const Center(
        child: Text(
          'Step Counter Page - Content goes here',
          style: TextStyle(fontSize: 20, fontFamily: "OpenSans-VariableFont_wdth,wght"),
        ),
      ),
    );
  }
}
