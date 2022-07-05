// To parse this JSON data, do
//
//     final studentDocumentResponseModel = studentDocumentResponseModelFromJson(jsonString);

import 'dart:convert';

List<StudentDocumentResponseModel> studentDocumentResponseModelFromJson(
        String str) =>
    List<StudentDocumentResponseModel>.from(
        json.decode(str).map((x) => StudentDocumentResponseModel.fromJson(x)));

String studentDocumentResponseModelToJson(
        List<StudentDocumentResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentDocumentResponseModel {
  StudentDocumentResponseModel({
    this.documentId,
    this.docPath,
    this.documentName,
    this.addStamp,
    this.documentStatus,
    this.reviewRemark,
    this.reviewStamp,
    this.documentTypeId,
    this.receiveStamp,
    this.receiveUser,
    this.receiveRemark,
    this.expiryDate,
    this.docDescription,
    this.uploadBy,
    this.intakeName,
  });

  int? documentId;
  String? docPath;
  String? documentName;
  DateTime? addStamp;
  dynamic documentStatus;
  dynamic reviewRemark;
  dynamic reviewStamp;
  int? documentTypeId;
  dynamic receiveStamp;
  dynamic receiveUser;
  dynamic receiveRemark;
  dynamic expiryDate;
  dynamic docDescription;
  String? uploadBy;
  dynamic intakeName;

  factory StudentDocumentResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentDocumentResponseModel(
        documentId: json["DocumentId"],
        docPath: json["DocPath"],
        documentName: json["DocumentName"],
        addStamp: DateTime.parse(json["AddStamp"]),
        documentStatus: json["DocumentStatus"],
        reviewRemark: json["ReviewRemark"],
        reviewStamp: json["ReviewStamp"],
        documentTypeId: json["DocumentTypeId"],
        receiveStamp: json["ReceiveStamp"],
        receiveUser: json["ReceiveUser"],
        receiveRemark: json["ReceiveRemark"],
        expiryDate: json["ExpiryDate"],
        docDescription: json["DocDescription"],
        uploadBy: json["UploadBy"],
        intakeName: json["IntakeName"],
      );

  Map<String, dynamic> toJson() => {
        "DocumentId": documentId,
        "DocPath": docPath,
        "DocumentName": documentName,
        "AddStamp": addStamp!.toIso8601String(),
        "DocumentStatus": documentStatus,
        "ReviewRemark": reviewRemark,
        "ReviewStamp": reviewStamp,
        "DocumentTypeId": documentTypeId,
        "ReceiveStamp": receiveStamp,
        "ReceiveUser": receiveUser,
        "ReceiveRemark": receiveRemark,
        "ExpiryDate": expiryDate,
        "DocDescription": docDescription,
        "UploadBy": uploadBy,
        "IntakeName": intakeName,
      };
}
