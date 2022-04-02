// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "message": message == null ? null : message,
    "status": status == null ? null : status,
  };
}

class Data {
  Data({
    this.location,
    this.isActive,
    this.id,
    this.email,
    this.userName,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
  });

  Location location;
  bool isActive;
  String id;
  String email;
  String userName;
  String role;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    isActive: json["isActive"] == null ? null : json["isActive"],
    id: json["_id"] == null ? null : json["_id"],
    email: json["email"] == null ? null : json["email"],
    userName: json["userName"] == null ? null : json["userName"],
    role: json["role"] == null ? null : json["role"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "location": location == null ? null : location.toJson(),
    "isActive": isActive == null ? null : isActive,
    "_id": id == null ? null : id,
    "email": email == null ? null : email,
    "userName": userName == null ? null : userName,
    "role": role == null ? null : role,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "__v": v == null ? null : v,
    "token": token == null ? null : token,
  };
}

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  String type;
  List<dynamic> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"] == null ? null : json["type"],
    coordinates: json["coordinates"] == null ? null : List<dynamic>.from(json["coordinates"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
  };
}
