// To parse this JSON data, do
//
//     final retrieveAppResponseModel = retrieveAppResponseModelFromJson(jsonString);

import 'dart:convert';

List<RetrieveAppResponseModel> retrieveAppResponseModelFromJson(String str) =>
    List<RetrieveAppResponseModel>.from(
        json.decode(str).map((x) => RetrieveAppResponseModel.fromJson(x)));

String retrieveAppResponseModelToJson(List<RetrieveAppResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RetrieveAppResponseModel {
  RetrieveAppResponseModel({
    this.applicationId,
    this.studentId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.addStamp,
    this.programName,
    this.instName,
    this.applicationStatus,
    this.intekDate,
    this.passportNo,
    this.deleteId,
    this.deleteUser,
    this.deleteStamp,
  });

  int? applicationId;
  int? studentId;
  String? firstName;
  String? middleName;
  String? lastName;
  DateTime? addStamp;
  String? programName;
  String? instName;
  String? applicationStatus;
  DateTime? intekDate;
  String? passportNo;
  int? deleteId;
  String? deleteUser;
  DateTime? deleteStamp;

  factory RetrieveAppResponseModel.fromJson(Map<String, dynamic> json) =>
      RetrieveAppResponseModel(
        applicationId: json["ApplicationId"],
        studentId: json["StudentId"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        addStamp: DateTime.parse(json["AddStamp"]),
        programName: json["ProgramName"],
        instName: json["InstName"],
        applicationStatus: json["ApplicationStatus"],
        intekDate: DateTime.parse(json["IntekDate"]),
        passportNo: json["PassportNo"],
        deleteId: json["DeleteId"],
        deleteUser: json["DeleteUser"],
        deleteStamp: DateTime.parse(json["DeleteStamp"]),
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "StudentId": studentId,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "AddStamp": addStamp!.toIso8601String(),
        "ProgramName": programName,
        "InstName": instName,
        "ApplicationStatus": applicationStatus,
        "IntekDate": intekDate!.toIso8601String(),
        "PassportNo": passportNo,
        "DeleteId": deleteId,
        "DeleteUser": deleteUser,
        "DeleteStamp": deleteStamp!.toIso8601String(),
      };
}
