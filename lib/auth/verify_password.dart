import 'package:flutter/material.dart';
import 'package:uber_clone/mainScreens/main_screen.dart';
import 'package:uber_clone/widget/constant.dart';

class VerifyPassword extends StatefulWidget {
  VerifyPassword({Key? key}) : super(key: key);

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  'assets/images/uber.png',
                  height: 200.0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.text,
                controller: passwordTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                decoration: textFieldInputDecoration(
                  'Password',
                  'Password',
                  const Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.text,
                controller: confirmPasswordTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                decoration: textFieldInputDecoration(
                  'Confirm Password',
                  'Confirm Password',
                  const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    //Saved info to firebase
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent,
                    onPrimary: Colors.blueGrey[900],
                    elevation: 0,
                    padding: const EdgeInsets.all(22),
                  ),
                  child: const Text("Reset Password"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
