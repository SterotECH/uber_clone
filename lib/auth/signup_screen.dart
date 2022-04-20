import 'package:flutter/material.dart';
import 'package:uber_clone/auth/car_info_screen.dart';
import 'package:uber_clone/auth/login_screen.dart';
import 'package:uber_clone/widget/constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
                "Register as Driver",
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
                controller: nameTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                decoration: textFieldInputDecoration(
                  'Name',
                  'Name',
                  const Icon(Icons.person),
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
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                decoration: textFieldInputDecoration(
                  'Phone Number',
                  'Phone Number',
                  const Icon(Icons.phone),
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
                        builder: (context) => carInfoScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent,
                    onPrimary: Colors.blueGrey[900],
                    elevation: 0,
                    padding: const EdgeInsets.all(22),
                  ),
                  child: const Text("Create Account"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Already have an Account? ",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("Sign in now")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
