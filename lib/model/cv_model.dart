// To parse this JSON data, do
//
//     final cvModel = cvModelFromJson(jsonString);

import 'dart:convert';

CvModel cvModelFromJson(String str) => CvModel.fromJson(json.decode(str));

String cvModelToJson(CvModel data) => json.encode(data.toJson());

class CvModel {
  CvModel({
    this.data,
    this.status,
  });

  Data data;
  int status;

  factory CvModel.fromJson(Map<String, dynamic> json) => CvModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "status": status == null ? null : status,
  };
}

class Data {
  Data({
    this.image,
    this.isActive,
    this.id,
    this.userId,
    this.name,
    this.profileAddress,
    this.email,
    this.phone,
    this.degree,
    this.university,
    this.grade,
    this.year,
    this.companyName,
    this.jobTitle,
    this.startDate,
    this.endDate,
    this.details,
    this.skill,
    this.objective,
    this.refName,
    this.refJobTitle,
    this.refCompanyName,
    this.refEmail,
    this.refPhone,
    this.projectTitle,
    this.projectDesription,
    this.helpTips,
    this.experience,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<Image> image;
  bool isActive;
  String id;
  String userId;
  String name;
  String profileAddress;
  String email;
  String phone;
  String degree;
  String university;
  String grade;
  String year;
  String companyName;
  String jobTitle;
  String startDate;
  String endDate;
  String details;
  String skill;
  String objective;
  String refName;
  String refJobTitle;
  String refCompanyName;
  String refEmail;
  String refPhone;
  String projectTitle;
  String projectDesription;
  String helpTips;
  String experience;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    image: json["image"] == null ? null : List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
    isActive: json["isActive"] == null ? null : json["isActive"],
    id: json["_id"] == null ? null : json["_id"],
    userId: json["userId"] == null ? null : json["userId"],
    name: json["name"] == null ? null : json["name"],
    profileAddress: json["profile_address"] == null ? null : json["profile_address"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    degree: json["degree"] == null ? null : json["degree"],
    university: json["university"] == null ? null : json["university"],
    grade: json["grade"] == null ? null : json["grade"],
    year: json["year"] == null ? null : json["year"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    jobTitle: json["job_title"] == null ? null : json["job_title"],
    startDate: json["start_date"] == null ? null : json["start_date"],
    endDate: json["end_date"] == null ? null : json["end_date"],
    details: json["details"] == null ? null : json["details"],
    skill: json["skill"] == null ? null : json["skill"],
    objective: json["objective"] == null ? null : json["objective"],
    refName: json["ref_name"] == null ? null : json["ref_name"],
    refJobTitle: json["ref_job_title"] == null ? null : json["ref_job_title"],
    refCompanyName: json["ref_company_name"] == null ? null : json["ref_company_name"],
    refEmail: json["ref_email"] == null ? null : json["ref_email"],
    refPhone: json["ref_phone"] == null ? null : json["ref_phone"],
    projectTitle: json["project_title"] == null ? null : json["project_title"],
    projectDesription: json["project_desription"] == null ? null : json["project_desription"],
    helpTips: json["help_tips"] == null ? null : json["help_tips"],
    experience: json["experience"] == null ? null : json["experience"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "image": image == null ? null : List<dynamic>.from(image.map((x) => x.toJson())),
    "isActive": isActive == null ? null : isActive,
    "_id": id == null ? null : id,
    "userId": userId == null ? null : userId,
    "name": name == null ? null : name,
    "profile_address": profileAddress == null ? null : profileAddress,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "degree": degree == null ? null : degree,
    "university": university == null ? null : university,
    "grade": grade == null ? null : grade,
    "year": year == null ? null : year,
    "company_name": companyName == null ? null : companyName,
    "job_title": jobTitle == null ? null : jobTitle,
    "start_date": startDate == null ? null : startDate,
    "end_date": endDate == null ? null : endDate,
    "details": details == null ? null : details,
    "skill": skill == null ? null : skill,
    "objective": objective == null ? null : objective,
    "ref_name": refName == null ? null : refName,
    "ref_job_title": refJobTitle == null ? null : refJobTitle,
    "ref_company_name": refCompanyName == null ? null : refCompanyName,
    "ref_email": refEmail == null ? null : refEmail,
    "ref_phone": refPhone == null ? null : refPhone,
    "project_title": projectTitle == null ? null : projectTitle,
    "project_desription": projectDesription == null ? null : projectDesription,
    "help_tips": helpTips == null ? null : helpTips,
    "experience": experience == null ? null : experience,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

class Image {
  Image({
    this.type,
    this.url,
  });

  String type;
  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    type: json["type"] == null ? null : json["type"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "url": url == null ? null : url,
  };
}
