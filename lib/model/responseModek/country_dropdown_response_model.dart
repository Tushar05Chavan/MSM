// To parse this JSON data, do
//
//     final countryDropResponseModel = countryDropResponseModelFromJson(jsonString);

import 'dart:convert';

List<CountryDropResponseModel> countryDropResponseModelFromJson(String str) =>
    List<CountryDropResponseModel>.from(
        json.decode(str).map((x) => CountryDropResponseModel.fromJson(x)));

String countryDropResponseModelToJson(List<CountryDropResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryDropResponseModel {
  CountryDropResponseModel({
    this.countryId,
    this.countryName,
  });

  int? countryId;
  String? countryName;

  factory CountryDropResponseModel.fromJson(Map<String, dynamic> json) =>
      CountryDropResponseModel(
        countryId: json["CountryId"],
        countryName: json["CountryName"],
      );

  Map<String, dynamic> toJson() => {
        "CountryId": countryId,
        "CountryName": countryName,
      };
}
