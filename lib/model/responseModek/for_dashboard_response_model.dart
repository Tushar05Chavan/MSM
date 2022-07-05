// To parse this JSON data, do
//
//     final forDashboardResponseModel = forDashboardResponseModelFromJson(jsonString);

import 'dart:convert';

List<ForDashboardResponseModel> forDashboardResponseModelFromJson(String str) =>
    List<ForDashboardResponseModel>.from(
        json.decode(str).map((x) => ForDashboardResponseModel.fromJson(x)));

String forDashboardResponseModelToJson(List<ForDashboardResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForDashboardResponseModel {
  ForDashboardResponseModel({
    this.institutionName,
    this.instLogoPath,
    this.waiverPer,
  });

  String? institutionName;
  String? instLogoPath;
  int? waiverPer;

  factory ForDashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      ForDashboardResponseModel(
        institutionName: json["InstitutionName"],
        instLogoPath: json["InstLogoPath"],
        waiverPer: json["WaiverPer"],
      );

  Map<String, dynamic> toJson() => {
        "InstitutionName": institutionName,
        "InstLogoPath": instLogoPath,
        "WaiverPer": waiverPer,
      };
}
