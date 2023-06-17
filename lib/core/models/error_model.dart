// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  final Message? message;

  ErrorModel({
    this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    message: json["message"] == null ? null : Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message?.toJson(),
  };
}

class Message {
  final String? name;
  final String? value;
  final bool? resourceNotFound;
  final dynamic searchedLocation;

  Message({
    this.name,
    this.value,
    this.resourceNotFound,
    this.searchedLocation,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    name: json["name"],
    value: json["value"],
    resourceNotFound: json["resourceNotFound"],
    searchedLocation: json["searchedLocation"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
    "resourceNotFound": resourceNotFound,
    "searchedLocation": searchedLocation,
  };
}
