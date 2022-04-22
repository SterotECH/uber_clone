import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_clone/global/global.dart';
import 'package:uber_clone/screens/splashScreen/splash_screen.dart';
import 'package:uber_clone/widget/constant.dart';
import 'package:uber_clone/widget/progress_dialog.dart';

class CarInfoScreen extends StatefulWidget {
  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();
  List<String> carTypeList = ["Uber-X", "Uber-go", "bike"];
  String? selectedCarType;

  validateCarInfo() {
    if (carColorTextEditingController.text.isEmpty &&
        carModelTextEditingController.text.isEmpty &&
        carNumberTextEditingController.text.isEmpty &&
        selectedCarType == null) {
      Fluttertoast.showToast(msg: "All fields are required");
    } else {
      saveCarInfoNow();
    }
  }

  saveCarInfoNow() {
    showDialog(
      context: context,
      builder: (BuildContext c) => ProgressDialog(
        message: "Processing please wait",
      ),
      barrierDismissible: false,
    );
    Map driverCarInfo = {
      "car_color": carColorTextEditingController.text.toLowerCase().trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference driversRef =
        FirebaseDatabase.instance.ref().child("driver");

    driversRef
        .child(currentFirebaseUser!.uid)
        .child("car_details")
        .set(driverCarInfo);
    Fluttertoast.showToast(
        msg: "Car Details have being saved, Congratulations");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MySplashScreen(),
      ),
    );
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
                "Car Details",
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
                controller: carModelTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                decoration: textFieldInputDecoration(
                  'Car Model',
                  'Car Model',
                  const Icon(Icons.car_rental),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: carNumberTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                decoration: textFieldInputDecoration(
                  'Car Number',
                  'Car Number',
                  const Icon(Icons.numbers),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: carColorTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                decoration: textFieldInputDecoration(
                  'Car Color',
                  'Car Color',
                  const Icon(Icons.color_lens),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                    iconSize: 26,
                    dropdownColor: Colors.blueGrey[700],
                    hint: const Text("Please Choose car Type"),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    items: carTypeList
                        .map(
                          (car) => DropdownMenuItem(
                            child: Text(
                              car,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            value: car,
                          ),
                        )
                        .toList(),
                    value: selectedCarType,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCarType = newValue.toString();
                      });
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    //Saved info to firebase
                    validateCarInfo();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent,
                    onPrimary: Colors.blueGrey[900],
                    elevation: 0,
                    padding: const EdgeInsets.all(22),
                  ),
                  child: const Text("Create Car Details"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
