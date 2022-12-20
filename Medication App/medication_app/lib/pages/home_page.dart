import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medication_app/models/medication_list.dart';
import 'package:medication_app/pages/add_medication.dart';
import 'package:medication_app/widgets/medication_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences pref;
  Medication? medication = null;

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 255, 207),
        appBar: AppBar(
          title: Center(child: Text("Medication App")),
          backgroundColor: Colors.lightGreen,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddMedication()));
          },
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [MedicationItem()],
        ));
  }

  void initPreferences() async {
    pref = await SharedPreferences.getInstance();

    setState(() {
      medication =
          Medication.fromJson(jsonDecode(pref.getString("medicineData")!));
    });
  }
}
