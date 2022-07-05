// To parse this JSON data, do
//
//     final relationResponseModel = relationResponseModelFromJson(jsonString);

import 'dart:convert';

List<RelationResponseModel> relationResponseModelFromJson(String str) =>
    List<RelationResponseModel>.from(
        json.decode(str).map((x) => RelationResponseModel.fromJson(x)));

String relationResponseModelToJson(List<RelationResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RelationResponseModel {
  RelationResponseModel({
    this.relationId,
    this.relation,
  });

  int? relationId;
  String? relation;

  factory RelationResponseModel.fromJson(Map<String, dynamic> json) =>
      RelationResponseModel(
        relationId: json["RelationId"],
        relation: json["Relation"],
      );

  Map<String, dynamic> toJson() => {
        "RelationId": relationId,
        "Relation": relation,
      };
}
