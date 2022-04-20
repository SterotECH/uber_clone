import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uber_clone/mainScreens/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() async {
    Timer(
      const Duration(seconds: 4),
      () {
        //Send user to the main Screen or otherwise send teh user to the login screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
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
