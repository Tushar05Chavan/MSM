// To parse this JSON data, do
//
//     final documentDropResponseModel = documentDropResponseModelFromJson(jsonString);

import 'dart:convert';

List<DocumentDropResponseModel> documentDropResponseModelFromJson(String str) =>
    List<DocumentDropResponseModel>.from(
        json.decode(str).map((x) => DocumentDropResponseModel.fromJson(x)));

String documentDropResponseModelToJson(List<DocumentDropResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentDropResponseModel {
  DocumentDropResponseModel({
    this.documentTypeId,
    this.documentName,
    this.required,
    this.sizelimit,
    this.acceptformat,
  });

  int? documentTypeId;
  String? documentName;
  bool? required;
  int? sizelimit;
  String? acceptformat;

  factory DocumentDropResponseModel.fromJson(Map<String, dynamic> json) =>
      DocumentDropResponseModel(
        documentTypeId: json["DocumentTypeId"],
        documentName: json["DocumentName"],
        required: json["required"],
        sizelimit: json["sizelimit"],
        acceptformat: json["acceptformat"],
      );

  Map<String, dynamic> toJson() => {
        "DocumentTypeId": documentTypeId,
        "DocumentName": documentName,
        "required": required,
        "sizelimit": sizelimit,
        "acceptformat": acceptformat,
      };
}
