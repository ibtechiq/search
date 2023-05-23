import 'package:search/models/payment_model.dart';
import 'package:search/models/work_hour_model.dart';

import 'certificate_model.dart';

class SearchModel {
  int id;
  String name;
  int userId;
  bool block;
  String image;
  String address;
  String categoryName;
  int userCount;
  bool isFavorite;
  double rating;
  int experience;
  String description;
  String phone;
  double lat;
  double long;
  int clinicId;
  String step;
  List<Certificate> certificates;
  List<Certificate> studies;
  List<Payment> payments;
  List<Certificate> pictures;
  List<WorkHour> workHours;
  List<Certificate> specializations;

  SearchModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.block,
    required this.image,
    required this.address,
    required this.categoryName,
    required this.userCount,
    required this.isFavorite,
    required this.rating,
    required this.experience,
    required this.description,
    required this.phone,
    required this.lat,
    required this.long,
    required this.clinicId,
    required this.step,
    required this.certificates,
    required this.studies,
    required this.payments,
    required this.pictures,
    required this.workHours,
    required this.specializations,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    id: json["id"],
    name: json["name"],
    userId: json["user_id"],
    block: json["block"],
    image: json["image"],
    address: json["address"],
    categoryName: json["category_name"],
    userCount: json["user_count"],
    isFavorite: json["is_favorite"],
    rating: json["rating"]?.toDouble(),
    experience: json["experience"],
    description: json["description"],
    phone: json["phone"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    clinicId: json["clinic_id"],
    step: json["step"],
    certificates: List<Certificate>.from(json["certificates"].map((x) => Certificate.fromJson(x))),
    studies: List<Certificate>.from(json["studies"].map((x) => Certificate.fromJson(x))),
    payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
    pictures: List<Certificate>.from(json["pictures"].map((x) => Certificate.fromJson(x))),
    workHours: List<WorkHour>.from(json["work-hours"].map((x) => WorkHour.fromJson(x))),
    specializations: List<Certificate>.from(json["specializations"].map((x) => Certificate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "user_id": userId,
    "block": block,
    "image": image,
    "address": address,
    "category_name": categoryName,
    "user_count": userCount,
    "is_favorite": isFavorite,
    "rating": rating,
    "experience": experience,
    "description": description,
    "phone": phone,
    "lat": lat,
    "long": long,
    "clinic_id": clinicId,
    "step": step,
    "certificates": List<dynamic>.from(certificates.map((x) => x.toJson())),
    "studies": List<dynamic>.from(studies.map((x) => x.toJson())),
    "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
    "pictures": List<dynamic>.from(pictures.map((x) => x.toJson())),
    "work-hours": List<dynamic>.from(workHours.map((x) => x.toJson())),
    "specializations": List<dynamic>.from(specializations.map((x) => x.toJson())),
  };
}





