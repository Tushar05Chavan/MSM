// To parse this JSON data, do
//
//     final recentApplicationsNewEnhanceResponseModel = recentApplicationsNewEnhanceResponseModelFromJson(jsonString);

import 'dart:convert';

List<RecentApplicationsNewEnhanceResponseModel>
    recentApplicationsNewEnhanceResponseModelFromJson(String str) =>
        List<RecentApplicationsNewEnhanceResponseModel>.from(json
            .decode(str)
            .map((x) => RecentApplicationsNewEnhanceResponseModel.fromJson(x)));

String recentApplicationsNewEnhanceResponseModelToJson(
        List<RecentApplicationsNewEnhanceResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecentApplicationsNewEnhanceResponseModel {
  RecentApplicationsNewEnhanceResponseModel({
    this.applicationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobileNo,
    this.programName,
    this.instName,
    this.intakeName,
    this.applicationStatusName,
    this.partnerTypeName,
  });

  int? applicationId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? mobileNo;
  String? programName;
  String? instName;
  String? intakeName;
  String? applicationStatusName;
  String? partnerTypeName;

  factory RecentApplicationsNewEnhanceResponseModel.fromJson(
          Map<String, dynamic> json) =>
      RecentApplicationsNewEnhanceResponseModel(
        applicationId: json["ApplicationId"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        mobileNo: json["MobileNo"],
        programName: json["ProgramName"],
        instName: json["InstName"],
        intakeName: json["IntakeName"],
        applicationStatusName: json["ApplicationStatusName"],
        partnerTypeName: json["PartnerTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "MobileNo": mobileNo,
        "ProgramName": programName,
        "InstName": instName,
        "IntakeName": intakeName,
        "ApplicationStatusName": applicationStatusName,
        "PartnerTypeName": partnerTypeName,
      };
}
