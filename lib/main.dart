// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Uber Clone Driver App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
        appBar: AppBar(
      elevation: 0,
      title: const Text("Welcome to driver App"),
    )),
  )));
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
