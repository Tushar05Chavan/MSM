// To parse this JSON data, do
//
//     final commissionResponseModel = commissionResponseModelFromJson(jsonString);

import 'dart:convert';

List<CommissionResponseModel> commissionResponseModelFromJson(String str) =>
    List<CommissionResponseModel>.from(
        json.decode(str).map((x) => CommissionResponseModel.fromJson(x)));

String commissionResponseModelToJson(List<CommissionResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommissionResponseModel {
  CommissionResponseModel({
    this.commissionId,
    this.instName,
    this.commissionType,
    this.noOfSemester,
    this.maximumAmount,
    this.currency,
    this.impact,
    this.partnerTypeName,
    this.agentName,
    this.esl,
    this.levelOfEducation,
    this.programs,
    this.intakeName,
    this.commissionTerms,
    this.institutionCountryName,
    this.agentId,
    this.institutionId,
    this.commissionPer,
    this.methodType,
    this.isNoOfStImpact,
    this.isMaximumLimit,
    this.impactBase,
    this.impactFromDate,
    this.impactToDate,
    this.programId,
    this.intakeGroupId,
    this.slabList,
  });

  int? commissionId;
  String? instName;
  String? commissionType;
  String? noOfSemester;
  dynamic maximumAmount;
  String? currency;
  String? impact;
  String? partnerTypeName;
  String? agentName;
  bool? esl;
  dynamic levelOfEducation;
  dynamic programs;
  dynamic intakeName;
  String? commissionTerms;
  String? institutionCountryName;
  dynamic agentId;
  dynamic institutionId;
  dynamic commissionPer;
  dynamic methodType;
  dynamic isNoOfStImpact;
  dynamic isMaximumLimit;
  dynamic impactBase;
  dynamic impactFromDate;
  dynamic impactToDate;
  dynamic programId;
  dynamic intakeGroupId;
  dynamic slabList;

  factory CommissionResponseModel.fromJson(Map<String, dynamic> json) =>
      CommissionResponseModel(
        commissionId: json["CommissionId"],
        instName: json["InstName"],
        commissionType: json["CommissionType"],
        noOfSemester: json["NoOfSemester"],
        maximumAmount: json["MaximumAmount"],
        currency: json["Currency"],
        impact: json["Impact"],
        partnerTypeName: json["PartnerTypeName"],
        agentName: json["AgentName"],
        esl: json["ESL"],
        levelOfEducation: json["LevelOfEducation"],
        programs: json["Programs"],
        intakeName: json["IntakeName"],
        commissionTerms: json["CommissionTerms"],
        institutionCountryName: json["InstitutionCountryName"],
        agentId: json["AgentId"],
        institutionId: json["InstitutionId"],
        commissionPer: json["CommissionPer"],
        methodType: json["MethodType"],
        isNoOfStImpact: json["isNoOfStImpact"],
        isMaximumLimit: json["IsMaximumLimit"],
        impactBase: json["ImpactBase"],
        impactFromDate: json["ImpactFromDate"],
        impactToDate: json["ImpactToDate"],
        programId: json["ProgramId"],
        intakeGroupId: json["IntakeGroupId"],
        slabList: json["slabList"],
      );

  Map<String, dynamic> toJson() => {
        "CommissionId": commissionId,
        "InstName": instName,
        "CommissionType": commissionType,
        "NoOfSemester": noOfSemester,
        "MaximumAmount": maximumAmount,
        "Currency": currency,
        "Impact": impact,
        "PartnerTypeName": partnerTypeName,
        "AgentName": agentName,
        "ESL": esl,
        "LevelOfEducation": levelOfEducation,
        "Programs": programs,
        "IntakeName": intakeName,
        "CommissionTerms": commissionTerms,
        "InstitutionCountryName": institutionCountryName,
        "AgentId": agentId,
        "InstitutionId": institutionId,
        "CommissionPer": commissionPer,
        "MethodType": methodType,
        "isNoOfStImpact": isNoOfStImpact,
        "IsMaximumLimit": isMaximumLimit,
        "ImpactBase": impactBase,
        "ImpactFromDate": impactFromDate,
        "ImpactToDate": impactToDate,
        "ProgramId": programId,
        "IntakeGroupId": intakeGroupId,
        "slabList": slabList,
      };
}
