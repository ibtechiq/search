import 'package:search/models/search_model.dart';
class SearchDataModel {
  bool status;
  int code;
  String msg;
  List<SearchModel> data;

  SearchDataModel({
    required this.status,
    required this.code,
    required this.msg,
    required this.data,
  });

  factory SearchDataModel.fromJson(Map<String, dynamic> json) => SearchDataModel(
    status: json["status"],
    code: json["code"],
    msg: json["msg"],
    data: List<SearchModel>.from(json["data"].map((x) => SearchModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
