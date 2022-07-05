// To parse this JSON data, do
//
//     final scholarshipResponseModel = scholarshipResponseModelFromJson(jsonString);

import 'dart:convert';

List<ScholarshipResponseModel> scholarshipResponseModelFromJson(String str) =>
    List<ScholarshipResponseModel>.from(
        json.decode(str).map((x) => ScholarshipResponseModel.fromJson(x)));

String scholarshipResponseModelToJson(List<ScholarshipResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScholarshipResponseModel {
  ScholarshipResponseModel({
    this.institutionName,
    this.instLogoPath,
    this.instCountry,
    this.minAmount,
    this.maxAmount,
    this.currency,
  });

  String? institutionName;
  String? instLogoPath;
  String? instCountry;
  int? minAmount;
  int? maxAmount;
  String? currency;

  factory ScholarshipResponseModel.fromJson(Map<String, dynamic> json) =>
      ScholarshipResponseModel(
        institutionName: json["InstitutionName"],
        instLogoPath: json["InstLogoPath"],
        instCountry: json["InstCountry"],
        minAmount: json["MinAmount"],
        maxAmount: json["MaxAmount"],
        currency: json["Currency"],
      );

  Map<String, dynamic> toJson() => {
        "InstitutionName": institutionName,
        "InstLogoPath": instLogoPath,
        "InstCountry": instCountry,
        "MinAmount": minAmount,
        "MaxAmount": maxAmount,
        "Currency": currency,
      };
}
