// To parse this JSON data, do
//
//     final educationProvinceResponseModel = educationProvinceResponseModelFromJson(jsonString);

import 'dart:convert';

List<EducationProvinceResponseModel> educationProvinceResponseModelFromJson(
        String str) =>
    List<EducationProvinceResponseModel>.from(json
        .decode(str)
        .map((x) => EducationProvinceResponseModel.fromJson(x)));

String educationProvinceResponseModelToJson(
        List<EducationProvinceResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EducationProvinceResponseModel {
  EducationProvinceResponseModel({
    this.provinceId,
    this.provinceName,
    this.pShortName,
  });

  int? provinceId;
  String? provinceName;
  dynamic pShortName;

  factory EducationProvinceResponseModel.fromJson(Map<dynamic, dynamic> json) =>
      EducationProvinceResponseModel(
        provinceId: json["ProvinceId"],
        provinceName: json["ProvinceName"],
        pShortName: json["PShortName"],
      );

  Map<dynamic, dynamic> toJson() => {
        "ProvinceId": provinceId,
        "ProvinceName": provinceName,
        "PShortName": pShortName,
      };
}
