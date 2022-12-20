import 'package:flutter/material.dart';
import 'package:medication_app/pages/home_page.dart';
import 'package:medication_app/pages/register_medicine.dart';
import 'package:medication_app/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMedication extends StatefulWidget {
  const AddMedication({super.key});

  @override
  State<AddMedication> createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quanityController = TextEditingController();
  TextEditingController consumptionController = TextEditingController();

  late SharedPreferences pref;

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add New Medication")),
        backgroundColor: Colors.lightGreen,
        elevation: 0,
      ),
      body: Container(
          margin: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Please enter the following information regaring your medication:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  customTextField(nameController, "Name of Medication"),
                  customTextField(quanityController, "Quanity"),
                  customTextField(consumptionController, "Consumption"),
                  ElevatedButton(
                    onPressed: () {
                      registerMedicine();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(),
                          ));
                    },
                    child: Text("Add Medication"),
                    style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                  ),
                ],
              ),
            ),
          )),
      backgroundColor: Color.fromARGB(255, 233, 255, 207),
    );
  }

  initPreferences() async {
    pref = await SharedPreferences.getInstance();
  }
}
