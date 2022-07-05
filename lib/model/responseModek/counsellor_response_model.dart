// To parse this JSON data, do
//
//     final counsellorResponseModel = counsellorResponseModelFromJson(jsonString);

import 'dart:convert';

List<CounsellorResponseModel> counsellorResponseModelFromJson(String str) =>
    List<CounsellorResponseModel>.from(
        json.decode(str).map((x) => CounsellorResponseModel.fromJson(x)));

String counsellorResponseModelToJson(List<CounsellorResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CounsellorResponseModel {
  CounsellorResponseModel({
    this.userId,
    this.displayName,
    this.emailId,
    this.city,
    this.country,
  });

  int? userId;
  String? displayName;
  String? emailId;
  String? city;
  String? country;

  factory CounsellorResponseModel.fromJson(Map<String, dynamic> json) =>
      CounsellorResponseModel(
        userId: json["UserId"],
        displayName: json["DisplayName"],
        emailId: json["EmailId"],
        city: json["City"],
        country: json["Country"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "DisplayName": displayName,
        "EmailId": emailId,
        "City": city,
        "Country": country,
      };
}
