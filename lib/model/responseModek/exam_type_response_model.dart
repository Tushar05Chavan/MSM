// To parse this JSON data, do
//
//     final examTypeResponseModel = examTypeResponseModelFromJson(jsonString);

import 'dart:convert';

List<ExamTypeResponseModel> examTypeResponseModelFromJson(String str) =>
    List<ExamTypeResponseModel>.from(
        json.decode(str).map((x) => ExamTypeResponseModel.fromJson(x)));

String examTypeResponseModelToJson(List<ExamTypeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamTypeResponseModel {
  ExamTypeResponseModel({
    this.reqId,
    this.reqName,
    this.sbjId,
    this.sbjName,
  });

  int? reqId;
  String? reqName;
  int? sbjId;
  dynamic sbjName;

  factory ExamTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      ExamTypeResponseModel(
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
