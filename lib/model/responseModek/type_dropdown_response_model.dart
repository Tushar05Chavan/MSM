// To parse this JSON data, do
//
//     final typeDropResponseModel = typeDropResponseModelFromJson(jsonString);

import 'dart:convert';

List<TypeDropResponseModel> typeDropResponseModelFromJson(String str) =>
    List<TypeDropResponseModel>.from(
        json.decode(str).map((x) => TypeDropResponseModel.fromJson(x)));

String typeDropResponseModelToJson(List<TypeDropResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeDropResponseModel {
  TypeDropResponseModel({
    this.visaTypeId,
    this.visaTypeName,
  });

  int? visaTypeId;
  String? visaTypeName;

  factory TypeDropResponseModel.fromJson(Map<String, dynamic> json) =>
      TypeDropResponseModel(
        visaTypeId: json["VisaTypeId"],
        visaTypeName: json["VisaTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "VisaTypeId": visaTypeId,
        "VisaTypeName": visaTypeName,
      };
}
