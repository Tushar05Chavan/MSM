// To parse this JSON data, do
//
//     final studentDocumentResponseModel = studentDocumentResponseModelFromJson(jsonString);

import 'dart:convert';

List<GetStudentDocumentResponseModel> studentDocumentResponseModelFromJson(
        String str) =>
    List<GetStudentDocumentResponseModel>.from(json
        .decode(str)
        .map((x) => GetStudentDocumentResponseModel.fromJson(x)));

String studentDocumentResponseModelToJson(
        List<GetStudentDocumentResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudentDocumentResponseModel {
  GetStudentDocumentResponseModel({
    this.documentId,
    this.documentName,
    this.region,
    this.documentTypeId,
    this.regionId,
  });

  int? documentId;
  String? documentName;
  dynamic region;
  int? documentTypeId;
  dynamic regionId;

  factory GetStudentDocumentResponseModel.fromJson(Map<String, dynamic> json) =>
      GetStudentDocumentResponseModel(
        documentId: json["DocumentId"],
        documentName: json["DocumentName"],
        region: json["Region"],
        documentTypeId: json["DocumentTypeId"],
        regionId: json["RegionId"],
      );

  Map<String, dynamic> toJson() => {
        "DocumentId": documentId,
        "DocumentName": documentName,
        "Region": region,
        "DocumentTypeId": documentTypeId,
        "RegionId": regionId,
      };
}
