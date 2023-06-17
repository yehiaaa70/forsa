// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

import 'package:forsa/core/models/company_model.dart';

import 'employee_model.dart';

class AuthModel {
  final String? role;
   int? id;
  final String? message;
  final bool? isAuthenticated;
  final String? username;
  final String? email;
  String? phone;
  final String? token;
  final String? refreshToken;
  final bool? otpSent;
  final String? defaultLang;
   EmployeeModel? employee;
   CompanyModel? company;
  final int? cityid;
  final String? cityName;

  AuthModel({
    this.role,
    this.id,
    this.message,
    this.isAuthenticated,
    this.username,
    this.cityid,
    this.cityName,
    this.email,
    this.phone,
    this.token,
    this.refreshToken,
    this.otpSent,
    this.defaultLang,
    this.employee,
    this.company,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        role: json["role"],
        id: json["id"],
        message: json["message"],
        isAuthenticated: json["isAuthenticated"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"] ?? '0',
        token: json["token"],
        refreshToken: json["refreshToken"],
        otpSent: json["otpSent"],
        cityid: json["cityid"],
        cityName: json["cityName"],
        defaultLang: json["defaultLang"],
        employee: json["employee"] == null
            ? null
            : EmployeeModel.fromJson(json["employee"]),
        company: json["company"] == null
            ? null
            : CompanyModel.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "isAuthenticated": isAuthenticated,
        "username": username,
        "email": email,
        "phone": phone,
        "token": token,
        "cityid": cityid,
        "cityName": cityName,
        "role": role,
        "id": id,
        "refreshToken": refreshToken,
        "otpSent": otpSent,
        "defaultLang": defaultLang,
        "employee": employee?.toJson(),
        "company": company?.toJson(),
      };
}
