
class Payment {
  int id;
  String name;
  int doctorId;

  Payment({
    required this.id,
    required this.name,
    required this.doctorId,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    name: json["name"],
    doctorId: json["doctor_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "doctor_id": doctorId,
  };
}
