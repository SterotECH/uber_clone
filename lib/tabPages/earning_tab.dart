import 'package:flutter/material.dart';

class EarningTabPage extends StatefulWidget {
  const EarningTabPage({Key? key}) : super(key: key);

  @override
  State<EarningTabPage> createState() => _EarningTabPageState();
}

class _EarningTabPageState extends State<EarningTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Earnings Tab Page",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
