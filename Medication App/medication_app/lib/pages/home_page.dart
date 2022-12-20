import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medication_app/models/medication_list.dart';
import 'package:medication_app/pages/add_medication.dart';
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
      body: medication != null
          ? Center(
              child: Column(
              children: [
                Text("${medication!.name}"),
                SizedBox(
                  height: 16,
                ),
                Text("${medication!.quanity}"),
                SizedBox(
                  height: 16,
                ),
                Text("${medication!.consumption}"),
                SizedBox(
                  height: 16,
                ),
              ],
            ))
          : SizedBox(),
    );
  }

  void initPreferences() async {
    pref = await SharedPreferences.getInstance();

    setState(() {
      medication =
          Medication.fromJson(jsonDecode(pref.getString("medicineData")!));
    });
  }
}
