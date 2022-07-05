// To parse this JSON data, do
//
//     final detailResModel = detailResModelFromJson(jsonString);

import 'dart:convert';

List<DetailResModel> detailResModelFromJson(String str) =>
    List<DetailResModel>.from(
        json.decode(str).map((x) => DetailResModel.fromJson(x)));

String detailResModelToJson(List<DetailResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailResModel {
  DetailResModel({
    this.applicationId,
    this.deferralRequestId,
    this.intakeId,
    this.intakeName,
    this.intakeDate,
    this.program,
    this.studentId,
    this.currentIntake,
    this.addUser,
    this.addStamp,
    this.institution,
    this.name,
    this.status,
  });

  int? applicationId;
  int? deferralRequestId;
  int? intakeId;
  String? intakeName;
  DateTime? intakeDate;
  String? program;
  String? studentId;
  String? currentIntake;
  String? addUser;
  DateTime? addStamp;
  String? institution;
  String? name;
  String? status;

  factory DetailResModel.fromJson(Map<String, dynamic> json) => DetailResModel(
        applicationId: json["ApplicationId"],
        deferralRequestId: json["DeferralRequestId"],
        intakeId: json["IntakeId"],
        intakeName: json["IntakeName"],
        intakeDate: DateTime.parse(json["IntakeDate"]),
        program: json["Program"],
        studentId: json["StudentId"],
        currentIntake: json["CurrentIntake"],
        addUser: json["AddUser"],
        addStamp: DateTime.parse(json["AddStamp"]),
        institution: json["Institution"],
        name: json["Name"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "DeferralRequestId": deferralRequestId,
        "IntakeId": intakeId,
        "IntakeName": intakeName,
        "IntakeDate": intakeDate!.toIso8601String(),
        "Program": program,
        "StudentId": studentId,
        "CurrentIntake": currentIntake,
        "AddUser": addUser,
        "AddStamp": addStamp!.toIso8601String(),
        "Institution": institution,
        "Name": name,
        "Status": status,
      };
}
