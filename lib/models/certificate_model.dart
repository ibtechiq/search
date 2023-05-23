
class Certificate {
  int id;
  String title;
  String image;
  String? file;
  int doctorId;

  Certificate({
    required this.id,
    required this.title,
    required this.image,
    this.file,
    required this.doctorId,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    file: json["file"],
    doctorId: json["doctor_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "file": file,
    "doctor_id": doctorId,
  };
}