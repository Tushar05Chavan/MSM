// To parse this JSON data, do
//
//     final scholarshipBannerResponseModel = scholarshipBannerResponseModelFromJson(jsonString);

import 'dart:convert';

List<ScholarshipBannerResponseModel> scholarshipBannerResponseModelFromJson(
        String str) =>
    List<ScholarshipBannerResponseModel>.from(json
        .decode(str)
        .map((x) => ScholarshipBannerResponseModel.fromJson(x)));

String scholarshipBannerResponseModelToJson(
        List<ScholarshipBannerResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScholarshipBannerResponseModel {
  ScholarshipBannerResponseModel({
    this.institutionId,
    this.bannerPath,
  });

  int? institutionId;
  String? bannerPath;

  factory ScholarshipBannerResponseModel.fromJson(Map<String, dynamic> json) =>
      ScholarshipBannerResponseModel(
        institutionId: json["InstitutionId"],
        bannerPath: json["BannerPath"],
      );

  Map<String, dynamic> toJson() => {
        "InstitutionId": institutionId,
        "BannerPath": bannerPath,
      };
}
