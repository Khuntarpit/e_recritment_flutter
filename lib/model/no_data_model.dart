// To parse this JSON data, do
//
//     final noDataModel = noDataModelFromJson(jsonString);

import 'dart:convert';

NoDataModel noDataModelFromJson(String str) => NoDataModel.fromJson(json.decode(str));

String noDataModelToJson(NoDataModel data) => json.encode(data.toJson());

class NoDataModel {
  NoDataModel({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory NoDataModel.fromJson(Map<String, dynamic> json) => NoDataModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}
