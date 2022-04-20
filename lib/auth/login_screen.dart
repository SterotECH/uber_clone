import 'package:flutter/material.dart';
import 'package:uber_clone/auth/reset_password_screen.dart';
import 'package:uber_clone/auth/signup_screen.dart';
import 'package:uber_clone/mainScreens/main_screen.dart';
import 'package:uber_clone/widget/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
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
                "Login as Driver",
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
                keyboardType: TextInputType.emailAddress,
                controller: emailTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                decoration: textFieldInputDecoration(
                  'E mail',
                  'E mail',
                  const Icon(Icons.email),
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
                  const Icon(Icons.password),
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
                  child: const Text("Login"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text("Forgotten Password"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Don't have Account?",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text("Sign up now")),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
