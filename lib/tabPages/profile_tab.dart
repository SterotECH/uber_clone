import 'package:flutter/material.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Profile Tab Page",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
