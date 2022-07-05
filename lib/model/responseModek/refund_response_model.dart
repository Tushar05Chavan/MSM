// To parse this JSON data, do
//
//     final refundResponseModel = refundResponseModelFromJson(jsonString);

import 'dart:convert';

List<RefundResponseModel> refundResponseModelFromJson(String str) =>
    List<RefundResponseModel>.from(
        json.decode(str).map((x) => RefundResponseModel.fromJson(x)));

String refundResponseModelToJson(List<RefundResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RefundResponseModel {
  RefundResponseModel({
    this.applicationId,
    this.studentId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.programName,
    this.intakeName,
    this.instName,
    this.initiateDate,
    this.submittedDate,
    this.rejectedDate,
    this.approvedDate,
    this.receivedDate,
    this.refundStatus,
    this.refundStatusDate,
    this.refundRemarks,
    this.statusName,
  });

  int? applicationId;
  int? studentId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? programName;
  String? intakeName;
  String? instName;
  DateTime? initiateDate;
  dynamic submittedDate;
  dynamic rejectedDate;
  dynamic approvedDate;
  dynamic receivedDate;
  int? refundStatus;
  DateTime? refundStatusDate;
  String? refundRemarks;
  String? statusName;

  factory RefundResponseModel.fromJson(Map<String, dynamic> json) =>
      RefundResponseModel(
        applicationId: json["ApplicationId"],
        studentId: json["StudentId"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        programName: json["ProgramName"],
        intakeName: json["IntakeName"],
        instName: json["InstName"],
        initiateDate: DateTime.parse(json["InitiateDate"]),
        submittedDate: json["SubmittedDate"],
        rejectedDate: json["RejectedDate"],
        approvedDate: json["ApprovedDate"],
        receivedDate: json["ReceivedDate"],
        refundStatus: json["RefundStatus"],
        refundStatusDate: DateTime.parse(json["RefundStatusDate"]),
        refundRemarks: json["RefundRemarks"],
        statusName: json["StatusName"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "StudentId": studentId,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "ProgramName": programName,
        "IntakeName": intakeName,
        "InstName": instName,
        "InitiateDate": initiateDate!.toIso8601String(),
        "SubmittedDate": submittedDate,
        "RejectedDate": rejectedDate,
        "ApprovedDate": approvedDate,
        "ReceivedDate": receivedDate,
        "RefundStatus": refundStatus,
        "RefundStatusDate": refundStatusDate!.toIso8601String(),
        "RefundRemarks": refundRemarks,
        "StatusName": statusName,
      };
}
