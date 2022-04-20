import 'package:flutter/material.dart';
import 'package:uber_clone/mainScreens/main_screen.dart';
import 'package:uber_clone/widget/constant.dart';

class carInfoScreen extends StatefulWidget {
  @override
  State<carInfoScreen> createState() => _carInfoScreenState();
}

class _carInfoScreenState extends State<carInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();
  List<String> carTypeList = ["Uber-X", "Uber-go", "bike"];
  String? selectedCarType;

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
