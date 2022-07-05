// To parse this JSON data, do
//
//     final conversionRatioResponseModel = conversionRatioResponseModelFromJson(jsonString);

import 'dart:convert';

ConversionRatioResponseModel conversionRatioResponseModelFromJson(String str) =>
    ConversionRatioResponseModel.fromJson(json.decode(str));

String conversionRatioResponseModelToJson(ConversionRatioResponseModel data) =>
    json.encode(data.toJson());

class ConversionRatioResponseModel {
  ConversionRatioResponseModel({
    this.data,
    this.columns,
  });

  List<Datum>? data;
  List<Column>? columns;

  factory ConversionRatioResponseModel.fromJson(Map<String, dynamic> json) =>
      ConversionRatioResponseModel(
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
    this.applicationTuitionDeposit,
    this.tuitionDepositStudyPermitApproval,
    this.tuitionDepositStudyPermitRefusal,
    this.studyPermitApprovalEnrolledStudent,
    this.studyPermitApprovalTransferredDropOutStudent,
  });

  String? intake;
  String? institution;
  int? applicationTuitionDeposit;
  double? tuitionDepositStudyPermitApproval;
  double? tuitionDepositStudyPermitRefusal;
  int? studyPermitApprovalEnrolledStudent;
  int? studyPermitApprovalTransferredDropOutStudent;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        intake: json["Intake"],
        institution: json["Institution"],
        applicationTuitionDeposit: json["Application: Tuition Deposit"],
        tuitionDepositStudyPermitApproval:
            json["Tuition Deposit: Study Permit Approval"],
        tuitionDepositStudyPermitRefusal:
            json["Tuition Deposit: Study Permit Refusal"],
        studyPermitApprovalEnrolledStudent:
            json["Study Permit Approval: Enrolled Student"],
        studyPermitApprovalTransferredDropOutStudent:
            json["Study Permit Approval: Transferred/ Drop Out Student"],
      );

  Map<String, dynamic> toJson() => {
        "Intake": intake,
        "Institution": institution,
        "Application: Tuition Deposit": applicationTuitionDeposit,
        "Tuition Deposit: Study Permit Approval":
            tuitionDepositStudyPermitApproval,
        "Tuition Deposit: Study Permit Refusal":
            tuitionDepositStudyPermitRefusal,
        "Study Permit Approval: Enrolled Student":
            studyPermitApprovalEnrolledStudent,
        "Study Permit Approval: Transferred/ Drop Out Student":
            studyPermitApprovalTransferredDropOutStudent,
      };
}
