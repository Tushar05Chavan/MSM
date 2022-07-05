// To parse this JSON data, do
//
//     final studApplicationResponseModel = studApplicationResponseModelFromJson(jsonString);

import 'dart:convert';

List<StudApplicationResponseModel> studApplicationResponseModelFromJson(
        String str) =>
    List<StudApplicationResponseModel>.from(
        json.decode(str).map((x) => StudApplicationResponseModel.fromJson(x)));

String studApplicationResponseModelToJson(
        List<StudApplicationResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudApplicationResponseModel {
  StudApplicationResponseModel({
    this.applicationId,
    this.addStamp,
    this.programName,
    this.instName,
    this.applicationStatus,
    this.intekDate,
    this.isSubmited,
  });

  int? applicationId;
  DateTime? addStamp;
  String? programName;
  String? instName;
  String? applicationStatus;
  DateTime? intekDate;
  int? isSubmited;

  factory StudApplicationResponseModel.fromJson(Map<String, dynamic> json) =>
      StudApplicationResponseModel(
        applicationId: json["ApplicationId"],
        addStamp: DateTime.parse(json["AddStamp"]),
        programName: json["ProgramName"],
        instName: json["InstName"],
        applicationStatus: json["ApplicationStatus"],
        intekDate: DateTime.parse(json["IntekDate"]),
        isSubmited: json["isSubmited"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "AddStamp": addStamp!.toIso8601String(),
        "ProgramName": programName,
        "InstName": instName,
        "ApplicationStatus": applicationStatus,
        "IntekDate": intekDate!.toIso8601String(),
        "isSubmited": isSubmited,
      };
}
