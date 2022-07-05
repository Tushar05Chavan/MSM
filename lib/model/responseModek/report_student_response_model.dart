// To parse this JSON data, do
//
//     final studentResponseModel = studentResponseModelFromJson(jsonString);

import 'dart:convert';

StudentResponseModel studentResponseModelFromJson(String str) =>
    StudentResponseModel.fromJson(json.decode(str));

String studentResponseModelToJson(StudentResponseModel data) =>
    json.encode(data.toJson());

class StudentResponseModel {
  StudentResponseModel({
    this.data,
  });

  List<Datum>? data;

  factory StudentResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.intake,
    this.institution,
    this.cityOfTheStudentAsPerPassport,
    this.stateOfTheStudentAsPerPassport,
    this.applications,
    this.tuitionDeposit,
    this.studyPermitApproval,
    this.studyPermitRefusal,
    this.enrolledStudent,
    this.transferedDropOut,
  });

  String? intake;
  String? institution;
  String? cityOfTheStudentAsPerPassport;
  String? stateOfTheStudentAsPerPassport;
  int? applications;
  int? tuitionDeposit;
  int? studyPermitApproval;
  int? studyPermitRefusal;
  int? enrolledStudent;
  int? transferedDropOut;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        intake: json["Intake"],
        institution: json["Institution"],
        cityOfTheStudentAsPerPassport:
            json["City of the student as per passport"],
        stateOfTheStudentAsPerPassport:
            json["State of the student as per passport"] == null
                ? null
                : json["State of the student as per passport"],
        applications: json["Applications"],
        tuitionDeposit: json["Tuition deposit"],
        studyPermitApproval: json["Study permit approval"],
        studyPermitRefusal: json["Study permit refusal"],
        enrolledStudent: json["Enrolled student"],
        transferedDropOut: json["Transfered/ Drop out"],
      );

  Map<String, dynamic> toJson() => {
        "Intake": intake,
        "Institution": institution,
        "City of the student as per passport": cityOfTheStudentAsPerPassport,
        "State of the student as per passport":
            stateOfTheStudentAsPerPassport == null
                ? null
                : stateOfTheStudentAsPerPassport,
        "Applications": applications,
        "Tuition deposit": tuitionDeposit,
        "Study permit approval": studyPermitApproval,
        "Study permit refusal": studyPermitRefusal,
        "Enrolled student": enrolledStudent,
        "Transfered/ Drop out": transferedDropOut,
      };
}
