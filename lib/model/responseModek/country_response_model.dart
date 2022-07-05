// To parse this JSON data, do
//
//     final countryResponseModel = countryResponseModelFromJson(jsonString);

import 'dart:convert';

List<CountryResponseModel> countryResponseModelFromJson(String str) =>
    List<CountryResponseModel>.from(
        json.decode(str).map((x) => CountryResponseModel.fromJson(x)));

String countryResponseModelToJson(List<CountryResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryResponseModel {
  CountryResponseModel({
    this.countryId,
    this.countryName,
    this.cShortName,
    this.countryCode,
  });

  int? countryId;
  String? countryName;
  String? cShortName;
  String? countryCode;

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) =>
      CountryResponseModel(
        countryId: json["CountryId"],
        countryName: json["CountryName"],
        cShortName: json["CShortName"],
        countryCode: json["CountryCode"],
      );

  Map<String, dynamic> toJson() => {
        "CountryId": countryId,
        "CountryName": countryName,
        "CShortName": cShortName,
        "CountryCode": countryCode,
      };
}
