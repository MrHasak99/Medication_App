import 'dart:convert';
import '../models/medication_list.dart';

void registerMedicine() async {
  var nameController;
  var quanityController;
  var consumptionController;

  final Medication medication = Medication(
      name: nameController.text,
      quanity: quanityController.text,
      consumption: consumptionController.text);

  String jsonString = jsonEncode(medication);
  var pref;
  pref.setString("medicineData", jsonString);
}
