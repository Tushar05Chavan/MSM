// To parse this JSON data, do
//
//     final knowledgeCenterResponseModel = knowledgeCenterResponseModelFromJson(jsonString);

import 'dart:convert';

List<KnowledgeCenterResponseModel> knowledgeCenterResponseModelFromJson(
        String str) =>
    List<KnowledgeCenterResponseModel>.from(
        json.decode(str).map((x) => KnowledgeCenterResponseModel.fromJson(x)));

String knowledgeCenterResponseModelToJson(
        List<KnowledgeCenterResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KnowledgeCenterResponseModel {
  KnowledgeCenterResponseModel({
    this.category,
    this.data,
  });

  String? category;
  List<Datum>? data;

  factory KnowledgeCenterResponseModel.fromJson(Map<String, dynamic> json) =>
      KnowledgeCenterResponseModel(
        category: json["category"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.knowledgeCid,
    this.categoryName,
    this.documentTitle,
    this.documentDescription,
  });

  int? knowledgeCid;
  String? categoryName;
  String? documentTitle;
  String? documentDescription;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        knowledgeCid: json["KnowledgeCID"],
        categoryName: json["CategoryName"],
        documentTitle: json["DocumentTitle"],
        documentDescription: json["DocumentDescription"],
      );

  Map<String, dynamic> toJson() => {
        "KnowledgeCID": knowledgeCid,
        "CategoryName": categoryName,
        "DocumentTitle": documentTitle,
        "DocumentDescription": documentDescription,
      };
}
