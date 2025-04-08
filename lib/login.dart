//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_fit/homepage.dart';
import 'package:personal_fit/password_reset.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkEmailVerificationStatus(context);
  }

  Future<void> checkEmailVerificationStatus(BuildContext context) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      user = _auth.currentUser; // Refresh the user data
      if (user!.emailVerified) {
        // User's email is verified
        print('User email is verified.');
      } else {
        // User's email is not verified
        print('User email is not verified.');
      }
    } else {
      // User is not signed in
      print('User is not signed in.');
    }
  }

  Future<void> signIn(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = userCredential.user;

      if (user != null) {
        if (user.emailVerified) {
          navigateToCalorieSpend(context);
        } else {
          showSnackbar(context, 'Please verify your email.');
        }
      }
    } catch (e) {
      showSnackbar(context, 'Sign-in failed. Please check your email and password.');
    }
  }

  void navigateToCalorieSpend(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Navigator.pushNamed(context, 'calorie_spend');
      } else {
        showSnackbar(context, 'Please verify your email.');
      }
    }
  }

  Future<void> resetPassword(BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      showSnackbar(context, 'Password reset email sent to ${emailController.text}');
    } catch (e) {
      showSnackbar(context, 'Error sending password reset email: $e');
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 120),
              child: const Text(
                'Welcome to\nPersonal Fit',
                style: TextStyle(color: Colors.white, fontSize: 33, fontFamily: "OpenSans-VariableFont_wdth,wght"),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          TextField(
                            controller: passwordController,
                            style: const TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700, fontFamily: "OpenSans-VariableFont_wdth,wght"),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xFFF05454),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    /*GestureDetector(
                                      onTap: () => navigateToCalorieSpend(context),*/
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FitnessApp()));
                                      },
                                      child: const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Color(0xFFA3C1AD),
                                        child: Icon(
                                          Icons.arrow_forward,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Forgot Password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black87,
                                    fontSize: 18,
                                  ),
                                ),
                              ),

                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black54,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
