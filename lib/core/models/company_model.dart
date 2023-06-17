// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

CompanyModel companyModelFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  final int? id;
  final int? userId;
  final String? companyName;
  final String? companyNameE;
  final String? whatsAppNo;
  final String? logo;
  final String? description;
  final String? descriptionE;
  final List<dynamic>? jobPosts;

  CompanyModel({
    this.id,
    this.userId,
    this.companyName,
    this.companyNameE,
    this.whatsAppNo,
    this.logo,
    this.description,
    this.descriptionE,
    this.jobPosts,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    id: json["id"],
    userId: json["userId"],
    companyName: json["companyName"],
    companyNameE: json["companyNameE"],
    whatsAppNo: json["whatsAppNo"],
    logo: json["logo"],
    description: json["description"],
    descriptionE: json["descriptionE"],
    jobPosts: json["jobPosts"] == null ? [] : List<dynamic>.from(json["jobPosts"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "companyName": companyName,
    "companyNameE": companyNameE,
    "whatsAppNo": whatsAppNo,
    "logo": logo,
    "description": description,
    "descriptionE": descriptionE,
    "jobPosts": jobPosts == null ? [] : List<dynamic>.from(jobPosts!.map((x) => x)),
  };
}
