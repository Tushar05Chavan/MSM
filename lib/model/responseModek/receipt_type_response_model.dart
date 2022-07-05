// To parse this JSON data, do
//
//     final receiptTypeResponseModel = receiptTypeResponseModelFromJson(jsonString);

import 'dart:convert';

List<ReceiptTypeResponseModel> receiptTypeResponseModelFromJson(String str) =>
    List<ReceiptTypeResponseModel>.from(
        json.decode(str).map((x) => ReceiptTypeResponseModel.fromJson(x)));

String receiptTypeResponseModelToJson(List<ReceiptTypeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReceiptTypeResponseModel {
  ReceiptTypeResponseModel({
    this.recTypeId,
    this.recTypeName,
  });

  int? recTypeId;
  String? recTypeName;

  factory ReceiptTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      ReceiptTypeResponseModel(
        recTypeId: json["RecTypeId"],
        recTypeName: json["RecTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "RecTypeId": recTypeId,
        "RecTypeName": recTypeName,
      };
}
