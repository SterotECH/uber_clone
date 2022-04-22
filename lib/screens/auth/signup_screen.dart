import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/screens/auth/car_info_screen.dart';
import 'package:uber_clone/screens/auth/login_screen.dart';
import 'package:uber_clone/global/global.dart';
import 'package:uber_clone/widget/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_clone/widget/progress_dialog.dart';

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

  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      Fluttertoast.showToast(msg: "Name must be at least three characters");
    } else if (!emailTextEditingController.text.contains('@')) {
      Fluttertoast.showToast(msg: "Email address is required");
    } else if (phoneTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Phone number must be more than 9 characters");
    } else if (passwordTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password is required");
    } else if (passwordTextEditingController.text.length < 7) {
      Fluttertoast.showToast(
          msg: "Password should be more than seven character");
    } else if (phoneTextEditingController.text.length < 8) {
      Fluttertoast.showToast(msg: "Phone number should be at least 9 digit");
    } else if (emailTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "email is required");
    } else if (nameTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Name is required");
    } else {
      saveDriverInfoNow();
    }
  }

  saveDriverInfoNow() async {
    showDialog(
      context: context,
      builder: (BuildContext c) {
        return ProgressDialog(
          message: "Processing please wait",
        );
      },
      barrierDismissible: false,
    );
    final User? firebaseUser = (await firebaseAuth
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError(
      (msg) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Error: ${msg.toString()}");
      },
    ))
        .user;
    if (firebaseUser != null) {
      Map driverMap = {
        "id": firebaseUser.uid,
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
      DatabaseReference driverRef =
          FirebaseDatabase.instance.ref().child("driver");
      driverRef.child(firebaseUser.uid).set(driverMap);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarInfoScreen(),
        ),
      );
      Fluttertoast.showToast(msg: "Account has being created ");
      currentFirebaseUser = firebaseUser;
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not being created ");
    }
  }

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
                    validateForm();
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
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
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
                    child: Text(
                      "Sign in now",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey[100],
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
