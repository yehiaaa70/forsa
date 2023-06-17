// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) => EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  final int? id;
  final int? userId;
  final int? jobCategoryId;
  final String? employeeName;
  final String? employeeNameE;
  final DateTime? dateOfBirth;
  final String? whatsAppNo;
  final String? photo;
  final String? qualifications;
  final String? address;
  final int? currentJobStatusId;
  final String? description;
  final String? lastSearchText;
  final bool? notifyMe;
  final int? genderId;
  final int? nationalityId;
  final int? residencyStatusId;
  final List<dynamic>? jobPosts;

  EmployeeModel({
    this.id,
    this.userId,
    this.jobCategoryId,
    this.employeeName,
    this.employeeNameE,
    this.dateOfBirth,
    this.whatsAppNo,
    this.photo,
    this.qualifications,
    this.address,
    this.currentJobStatusId,
    this.description,
    this.lastSearchText,
    this.notifyMe,
    this.genderId,
    this.nationalityId,
    this.residencyStatusId,
    this.jobPosts,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json["id"],
    userId: json["userId"],
    jobCategoryId: json["jobCategoryId"],
    employeeName: json["employeeName"],
    employeeNameE: json["employeeNameE"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    whatsAppNo: json["whatsAppNo"],
    photo: json["photo"],
    qualifications: json["qualifications"],
    address: json["address"],
    currentJobStatusId: json["currentJobStatusId"],
    description: json["description"],
    lastSearchText: json["lastSearchText"],
    notifyMe: json["notifyMe"],
    genderId: json["genderId"],
    nationalityId: json["nationalityId"],
    residencyStatusId: json["residencyStatusId"],
    jobPosts: json["jobPosts"] == null ? [] : List<dynamic>.from(json["jobPosts"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "jobCategoryId": jobCategoryId,
    "employeeName": employeeName,
    "employeeNameE": employeeNameE,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "whatsAppNo": whatsAppNo,
    "photo": photo,
    "qualifications": qualifications,
    "address": address,
    "currentJobStatusId": currentJobStatusId,
    "description": description,
    "lastSearchText": lastSearchText,
    "notifyMe": notifyMe,
    "genderId": genderId,
    "nationalityId": nationalityId,
    "residencyStatusId": residencyStatusId,
    "jobPosts": jobPosts == null ? [] : List<dynamic>.from(jobPosts!.map((x) => x)),
  };
}
