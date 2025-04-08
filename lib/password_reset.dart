import 'package:flutter/material.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your email to reset your password', style: TextStyle(
              color: Colors.white70,
              fontFamily: "OpenSans-VariableFont_wdth,wght.ttf",
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),),
            TextFormField(
              // Your email input field
            ),
            ElevatedButton(
              onPressed: () {
                // Add logic to send a password reset email
              },
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
