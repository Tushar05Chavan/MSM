// To parse this JSON data, do
//
//     final tilesResponseModel = tilesResponseModelFromJson(jsonString);

import 'dart:convert';

List<TilesResponseModel> tilesResponseModelFromJson(String str) =>
    List<TilesResponseModel>.from(
        json.decode(str).map((x) => TilesResponseModel.fromJson(x)));

String tilesResponseModelToJson(List<TilesResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TilesResponseModel {
  TilesResponseModel({
    this.name,
    this.noOfItem,
    this.differOfItem,
    this.growth,
  });

  String? name;
  int? noOfItem;
  int? differOfItem;
  double? growth;

  factory TilesResponseModel.fromJson(Map<String, dynamic> json) =>
      TilesResponseModel(
        name: json["Name"],
        noOfItem: json["NoOfItem"],
        differOfItem: json["DifferOfItem"],
        growth: json["Growth"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "NoOfItem": noOfItem,
        "DifferOfItem": differOfItem,
        "Growth": growth,
      };
}
