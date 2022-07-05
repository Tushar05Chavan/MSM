// To parse this JSON data, do
//
//     final getKnowledgeByIdResponseModel = getKnowledgeByIdResponseModelFromJson(jsonString);

import 'dart:convert';

GetKnowledgeByIdResponseModel getKnowledgeByIdResponseModelFromJson(
        String str) =>
    GetKnowledgeByIdResponseModel.fromJson(json.decode(str));

String getKnowledgeByIdResponseModelToJson(
        GetKnowledgeByIdResponseModel data) =>
    json.encode(data.toJson());

class GetKnowledgeByIdResponseModel {
  GetKnowledgeByIdResponseModel({
    this.knowledgeCid,
    this.categoryName,
    this.documentTitle,
    this.documentDescription,
    this.attachments,
  });

  int? knowledgeCid;
  String? categoryName;
  String? documentTitle;
  String? documentDescription;
  List<Attachment>? attachments;

  factory GetKnowledgeByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GetKnowledgeByIdResponseModel(
        knowledgeCid: json["KnowledgeCID"],
        categoryName: json["CategoryName"],
        documentTitle: json["DocumentTitle"],
        documentDescription: json["DocumentDescription"],
        attachments: List<Attachment>.from(
            json["Attachments"].map((x) => Attachment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "KnowledgeCID": knowledgeCid,
        "CategoryName": categoryName,
        "DocumentTitle": documentTitle,
        "DocumentDescription": documentDescription,
        "Attachments": List<dynamic>.from(attachments!.map((x) => x.toJson())),
      };
}

class Attachment {
  Attachment({
    this.documentName,
    this.docPath,
  });

  String? documentName;
  String? docPath;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        documentName: json["DocumentName"],
        docPath: json["DocPath"],
      );

  Map<String, dynamic> toJson() => {
        "DocumentName": documentName,
        "DocPath": docPath,
      };
}
