class WorkHour {
  int id;
  String name;
  String startAt;
  String endAt;
  int status;
  int doctorId;
  int clinicId;

  WorkHour({
    required this.id,
    required this.name,
    required this.startAt,
    required this.endAt,
    required this.status,
    required this.doctorId,
    required this.clinicId,
  });

  factory WorkHour.fromJson(Map<String, dynamic> json) => WorkHour(
    id: json["id"],
    name: json["name"],
    startAt: json["start_at"],
    endAt: json["end_at"],
    status: json["status"],
    doctorId: json["doctor_id"],
    clinicId: json["clinic_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "start_at": startAt,
    "end_at": endAt,
    "status": status,
    "doctor_id": doctorId,
    "clinic_id": clinicId,
  };
}