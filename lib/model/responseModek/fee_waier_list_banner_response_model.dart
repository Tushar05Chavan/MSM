// To parse this JSON data, do
//
//     final feeWaierListBannerResponseModel = feeWaierListBannerResponseModelFromJson(jsonString);

import 'dart:convert';

List<FeeWaierListBannerResponseModel> feeWaierListBannerResponseModelFromJson(String str) => List<FeeWaierListBannerResponseModel>.from(json.decode(str).map((x) => FeeWaierListBannerResponseModel.fromJson(x)));

String feeWaierListBannerResponseModelToJson(List<FeeWaierListBannerResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeeWaierListBannerResponseModel {
  FeeWaierListBannerResponseModel({
    this.institutionId,
    this.bannerPath,
  });

  int? institutionId;
  String? bannerPath;

  factory FeeWaierListBannerResponseModel.fromJson(Map<String, dynamic> json) => FeeWaierListBannerResponseModel(
    institutionId: json["InstitutionId"],
    bannerPath: json["BannerPath"],
  );

  Map<String, dynamic> toJson() => {
    "InstitutionId": institutionId,
    "BannerPath": bannerPath,
  };
}
