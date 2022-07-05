// To parse this JSON data, do
//
//     final countryCodeResponseModel = countryCodeResponseModelFromJson(jsonString);

import 'dart:convert';

List<CountryCodeResponseModel> countryCodeResponseModelFromJson(String str) =>
    List<CountryCodeResponseModel>.from(
        json.decode(str).map((x) => CountryCodeResponseModel.fromJson(x)));

String countryCodeResponseModelToJson(List<CountryCodeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryCodeResponseModel {
  CountryCodeResponseModel({
    this.countryName,
    this.countryCode,
  });

  String? countryName;
  String? countryCode;

  factory CountryCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      CountryCodeResponseModel(
        countryName: json["CountryName"],
        countryCode: json["CountryCode"],
      );

  Map<String, dynamic> toJson() => {
        "CountryName": countryName,
        "CountryCode": countryCode,
      };
}
