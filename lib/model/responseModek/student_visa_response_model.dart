// To parse this JSON data, do
//
//     final studentVisaResponseModel = studentVisaResponseModelFromJson(jsonString);

import 'dart:convert';

List<StudentVisaResponseModel> studentVisaResponseModelFromJson(String str) =>
    List<StudentVisaResponseModel>.from(
        json.decode(str).map((x) => StudentVisaResponseModel.fromJson(x)));

String studentVisaResponseModelToJson(List<StudentVisaResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentVisaResponseModel {
  StudentVisaResponseModel({
    required this.studentVisaId,
    required this.countryName,
    required this.visaTypeName,
    required this.visaStatus,
    required this.issueDate,
    required this.validUpto,
    required this.comment,
    this.countryId,
    this.visaTypeId,
  });

  int studentVisaId;
  String countryName;
  String visaTypeName;
  String visaStatus;
  DateTime issueDate;
  DateTime validUpto;
  String comment;
  int? countryId;
  int? visaTypeId;

  factory StudentVisaResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentVisaResponseModel(
        studentVisaId: json["StudentVisaId"],
        countryName: json["CountryName"],
        visaTypeName: json["VisaTypeName"],
        visaStatus: json["VisaStatus"],
        issueDate: DateTime.parse(json["IssueDate"]),
        validUpto: DateTime.parse(json["ValidUpto"]),
        comment: json["Comment"],
        countryId: json["CountryId"] as int?,
        visaTypeId: json["VisaTypeId"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "StudentVisaId": studentVisaId,
        "CountryName": countryName,
        "VisaTypeName": visaTypeName,
        "VisaStatus": visaStatus,
        "IssueDate": issueDate.toIso8601String(),
        "ValidUpto": validUpto.toIso8601String(),
        "Comment": comment,
        "CountryId": countryId,
        "VisaTypeId": visaTypeId,
      };
}
