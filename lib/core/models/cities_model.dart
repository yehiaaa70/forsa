// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

import 'dart:convert';

class CitiesModelList{
  final List<CitiesModel> cities;

  CitiesModelList(this.cities);

}

class CitiesModel {


  final int? id;
  final String? name;

  CitiesModel({
    this.id,
    this.name,
  });

  factory CitiesModel.fromRawJson(String str) => CitiesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
    id: json["id"],
    name:json["name"]??'no_name ',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
