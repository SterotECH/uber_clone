import 'package:flutter/material.dart';

class RatingsTabPage extends StatefulWidget {
  const RatingsTabPage({Key? key}) : super(key: key);

  @override
  State<RatingsTabPage> createState() => _RatingsTabPageState();
}

class _RatingsTabPageState extends State<RatingsTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Ratings Tab Page",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
