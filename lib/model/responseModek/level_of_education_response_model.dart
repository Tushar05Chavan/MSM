// To parse this JSON data, do
//
//     final levelOfEducationResponseModel = levelOfEducationResponseModelFromJson(jsonString);

import 'dart:convert';

List<LevelOfEducationResponseModel> levelOfEducationResponseModelFromJson(
        String str) =>
    List<LevelOfEducationResponseModel>.from(
        json.decode(str).map((x) => LevelOfEducationResponseModel.fromJson(x)));

String levelOfEducationResponseModelToJson(
        List<LevelOfEducationResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LevelOfEducationResponseModel {
  LevelOfEducationResponseModel({
    this.eduLevelId,
    this.eduLevelName,
  });

  int? eduLevelId;
  String? eduLevelName;

  factory LevelOfEducationResponseModel.fromJson(Map<String, dynamic> json) =>
      LevelOfEducationResponseModel(
        eduLevelId: json["EduLevelId"],
        eduLevelName: json["EduLevelName"],
      );

  Map<String, dynamic> toJson() => {
        "EduLevelId": eduLevelId,
        "EduLevelName": eduLevelName,
      };
}
