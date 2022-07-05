// To parse this JSON data, do
//
//     final instituteResponceModel = instituteResponceModelFromJson(jsonString);

import 'dart:convert';

List<InstituteResponceModel> instituteResponceModelFromJson(String str) =>
    List<InstituteResponceModel>.from(
        json.decode(str).map((x) => InstituteResponceModel.fromJson(x)));

String instituteResponceModelToJson(List<InstituteResponceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InstituteResponceModel {
  InstituteResponceModel({
    this.institutionId,
    this.instName,
    this.instAddress,
    this.cityName,
    this.provinceName,
    this.countryName,
    this.region,
    this.regions,
    this.noOfProgram,
    this.noOfOpenProgram,
    this.applicationStatus,
    this.applicationId,
    this.agentAuthStatus,
    this.regionOfMarketing,
    this.partnerTypeName,
    this.aefAvail,
    this.aefLink,
    this.statusRemark,
    this.isCommonAef,
    this.addStamp,
    this.instStatus,
    this.isHigherEdAef,
    this.aefType,
    this.orderBy,
    this.agreementId,
    this.category,
  });

  int? institutionId;
  String? instName;
  String? instAddress;
  String? cityName;
  String? provinceName;
  String? countryName;
  String? region;
  String? regions;
  int? noOfProgram;
  int? noOfOpenProgram;
  int? applicationStatus;
  dynamic applicationId;
  String? agentAuthStatus;
  String? regionOfMarketing;
  String? partnerTypeName;
  int? aefAvail;
  dynamic aefLink;
  String? statusRemark;
  dynamic isCommonAef;
  dynamic addStamp;
  dynamic instStatus;
  dynamic isHigherEdAef;
  String? aefType;
  int? orderBy;
  dynamic agreementId;
  dynamic category;

  factory InstituteResponceModel.fromJson(Map<String, dynamic> json) =>
      InstituteResponceModel(
        institutionId: json["InstitutionId"],
        instName: json["InstName"],
        instAddress: json["InstAddress"],
        cityName: json["CityName"],
        provinceName: json["ProvinceName"],
        countryName: json["CountryName"],
        region: json["Region"],
        regions: json["Regions"],
        noOfProgram: json["NoOfProgram"],
        noOfOpenProgram: json["NoOfOpenProgram"],
        applicationStatus: json["ApplicationStatus"],
        applicationId: json["ApplicationId"],
        agentAuthStatus: json["AgentAuthStatus"],
        regionOfMarketing: json["RegionOfMarketing"],
        partnerTypeName: json["PartnerTypeName"],
        aefAvail: json["AEFAvail"],
        aefLink: json["AEFLink"],
        statusRemark: json["StatusRemark"],
        isCommonAef: json["IsCommonAEF"],
        addStamp: json["AddStamp"],
        instStatus: json["InstStatus"],
        isHigherEdAef: json["IsHigherEdAEF"],
        aefType: json["AEFType"],
        orderBy: json["OrderBy"],
        agreementId: json["AgreementId"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "InstitutionId": institutionId,
        "InstName": instName,
        "InstAddress": instAddress,
        "CityName": cityName,
        "ProvinceName": provinceName,
        "CountryName": countryName,
        "Region": region,
        "Regions": regions,
        "NoOfProgram": noOfProgram,
        "NoOfOpenProgram": noOfOpenProgram,
        "ApplicationStatus": applicationStatus,
        "ApplicationId": applicationId,
        "AgentAuthStatus": agentAuthStatus,
        "RegionOfMarketing": regionOfMarketing,
        "PartnerTypeName": partnerTypeName,
        "AEFAvail": aefAvail,
        "AEFLink": aefLink,
        "StatusRemark": statusRemark,
        "IsCommonAEF": isCommonAef,
        "AddStamp": addStamp,
        "InstStatus": instStatus,
        "IsHigherEdAEF": isHigherEdAef,
        "AEFType": aefType,
        "OrderBy": orderBy,
        "AgreementId": agreementId,
        "Category": category,
      };
}
