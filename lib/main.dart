// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/splashScreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Uber Clone Driver App',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[900],
            primarySwatch: Colors.blue,
          ),
          home: const MySplashScreen()),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? child;
  MyApp({this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
