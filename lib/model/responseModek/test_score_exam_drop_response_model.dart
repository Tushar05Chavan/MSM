// To parse this JSON data, do
//
//     final examDropResponseModel = examDropResponseModelFromJson(jsonString);

import 'dart:convert';

List<ExamDropResponseModel> examDropResponseModelFromJson(String str) => List<ExamDropResponseModel>.from(json.decode(str).map((x) => ExamDropResponseModel.fromJson(x)));

String examDropResponseModelToJson(List<ExamDropResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamDropResponseModel {
  ExamDropResponseModel({
    this.reqId,
    this.reqName,
    this.sbjId,
    this.sbjName,
  });

  int? reqId;
  String? reqName;
  int? sbjId;
  dynamic sbjName;

  factory ExamDropResponseModel.fromJson(Map<String, dynamic> json) => ExamDropResponseModel(
    reqId: json["ReqId"],
    reqName: json["ReqName"],
    sbjId: json["SbjId"],
    sbjName: json["SbjName"],
  );

  Map<String, dynamic> toJson() => {
    "ReqId": reqId,
    "ReqName": reqName,
    "SbjId": sbjId,
    "SbjName": sbjName,
  };
}
