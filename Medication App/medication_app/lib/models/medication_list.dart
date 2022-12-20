class Medication {
  late String name;
  late String quanity;
  late String consumption;

  Medication(
      {required this.name, required this.quanity, required this.consumption});

  Medication.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quanity = json['quanity'];
    consumption = json['consumption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quanity'] = this.quanity;
    data['consumption'] = this.consumption;
    return data;
  }
}
