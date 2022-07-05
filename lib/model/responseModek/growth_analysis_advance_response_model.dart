// To parse this JSON data, do
//
//     final growthAnalysisAdvanceResponseModel = growthAnalysisAdvanceResponseModelFromJson(jsonString);

import 'dart:convert';

GrowthAnalysisAdvanceResponseModel growthAnalysisAdvanceResponseModelFromJson(
        String str) =>
    GrowthAnalysisAdvanceResponseModel.fromJson(json.decode(str));

String growthAnalysisAdvanceResponseModelToJson(
        GrowthAnalysisAdvanceResponseModel data) =>
    json.encode(data.toJson());

class GrowthAnalysisAdvanceResponseModel {
  GrowthAnalysisAdvanceResponseModel({
    this.data,
    this.columns,
  });

  List<Datum>? data;
  List<Column>? columns;

  factory GrowthAnalysisAdvanceResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GrowthAnalysisAdvanceResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        columns:
            List<Column>.from(json["columns"].map((x) => Column.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "columns": List<dynamic>.from(columns!.map((x) => x.toJson())),
      };
}

class Column {
  Column({
    this.columnDef,
    this.header,
    this.type,
    this.format,
    this.isTotal,
    this.isHtml,
  });

  String? columnDef;
  String? header;
  String? type;
  String? format;
  bool? isTotal;
  bool? isHtml;

  factory Column.fromJson(Map<String, dynamic> json) => Column(
        columnDef: json["columnDef"],
        header: json["header"],
        type: json["type"],
        format: json["format"],
        isTotal: json["isTotal"],
        isHtml: json["isHTML"],
      );

  Map<String, dynamic> toJson() => {
        "columnDef": columnDef,
        "header": header,
        "type": type,
        "format": format,
        "isTotal": isTotal,
        "isHTML": isHtml,
      };
}

class Datum {
  Datum({
    this.intake,
    this.institution,
    this.program,
    this.applications,
    this.tuitionDeposit,
    this.studyPermitApproval,
    this.studyPermitRefusal,
    this.enrolledStudent,
    this.transferedDropOut,
  });

  String? intake;
  String? institution;
  String? program;
  int? applications;
  int? tuitionDeposit;
  int? studyPermitApproval;
  int? studyPermitRefusal;
  int? enrolledStudent;
  int? transferedDropOut;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        intake: json["Intake"],
        institution: json["Institution"],
        program: json["Program"],
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
        "Program": program,
        "Applications": applications,
        "Tuition deposit": tuitionDeposit,
        "Study permit approval": studyPermitApproval,
        "Study permit refusal": studyPermitRefusal,
        "Enrolled student": enrolledStudent,
        "Transfered/ Drop out": transferedDropOut,
      };
}
