// To parse this JSON data, do
//
//     final provinceCountryResponseModel = provinceCountryResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProvinceCountryResponseModel> provinceCountryResponseModelFromJson(
        String str) =>
    List<ProvinceCountryResponseModel>.from(
        json.decode(str).map((x) => ProvinceCountryResponseModel.fromJson(x)));

String provinceCountryResponseModelToJson(
        List<ProvinceCountryResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProvinceCountryResponseModel {
  ProvinceCountryResponseModel({
    this.provinceId,
    this.provinceName,
    this.pShortName,
  });

  int? provinceId;
  String? provinceName;
  dynamic pShortName;

  factory ProvinceCountryResponseModel.fromJson(Map<String, dynamic> json) =>
      ProvinceCountryResponseModel(
        provinceId: json["ProvinceId"],
        provinceName: json["ProvinceName"],
        pShortName: json["PShortName"],
      );

  Map<String, dynamic> toJson() => {
        "ProvinceId": provinceId,
        "ProvinceName": provinceName,
        "PShortName": pShortName,
      };
}
