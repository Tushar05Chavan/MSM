// To parse this JSON data, do
//
//     final branchResponseModel = branchResponseModelFromJson(jsonString);

import 'dart:convert';

List<BranchResponseModel> branchResponseModelFromJson(String str) =>
    List<BranchResponseModel>.from(
        json.decode(str).map((x) => BranchResponseModel.fromJson(x)));

String branchResponseModelToJson(List<BranchResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchResponseModel {
  BranchResponseModel({
    this.branchId,
    this.agentId,
    this.branchName,
    this.branchAddress,
    this.branchEmail,
    this.branchPhone,
    this.countryId,
    this.countryName,
    this.provinceId,
    this.provinceName,
    this.city,
    this.contactPersonName,
    this.contactPersonEmailId,
    this.contactPersonPhone,
  });

  int? branchId;
  dynamic agentId;
  String? branchName;
  String? branchAddress;
  String? branchEmail;
  String? branchPhone;
  dynamic countryId;
  String? countryName;
  dynamic provinceId;
  String? provinceName;
  String? city;
  String? contactPersonName;
  String? contactPersonEmailId;
  String? contactPersonPhone;

  factory BranchResponseModel.fromJson(Map<String, dynamic> json) =>
      BranchResponseModel(
        branchId: json["BranchId"],
        agentId: json["AgentId"],
        branchName: json["BranchName"],
        branchAddress: json["BranchAddress"],
        branchEmail: json["BranchEmail"],
        branchPhone: json["BranchPhone"],
        countryId: json["CountryId"],
        countryName: json["CountryName"],
        provinceId: json["ProvinceId"],
        provinceName: json["ProvinceName"],
        city: json["City"],
        contactPersonName: json["ContactPersonName"],
        contactPersonEmailId: json["ContactPersonEmailId"],
        contactPersonPhone: json["ContactPersonPhone"],
      );

  Map<String, dynamic> toJson() => {
        "BranchId": branchId,
        "AgentId": agentId,
        "BranchName": branchName,
        "BranchAddress": branchAddress,
        "BranchEmail": branchEmail,
        "BranchPhone": branchPhone,
        "CountryId": countryId,
        "CountryName": countryName,
        "ProvinceId": provinceId,
        "ProvinceName": provinceName,
        "City": city,
        "ContactPersonName": contactPersonName,
        "ContactPersonEmailId": contactPersonEmailId,
        "ContactPersonPhone": contactPersonPhone,
      };
}
