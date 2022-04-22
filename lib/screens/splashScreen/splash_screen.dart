import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uber_clone/global/global.dart';
import 'package:uber_clone/screens/auth/login_screen.dart';
import 'package:uber_clone/screens/mainScreens/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(
      const Duration(seconds: 4),
      () async {
        //Send user to the main Screen or otherwise send teh user to the login screen
        if (firebaseAuth.currentUser != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.blueGrey[900],
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Center(
                    child: Image.asset("assets/images/uber.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Stero Uber",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
