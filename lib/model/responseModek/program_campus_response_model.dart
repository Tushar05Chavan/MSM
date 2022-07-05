// To parse this JSON data, do
//
//     final programCampusResponseModel = programCampusResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProgramCampusResponseModel> programCampusResponseModelFromJson(
        String str) =>
    List<ProgramCampusResponseModel>.from(
        json.decode(str).map((x) => ProgramCampusResponseModel.fromJson(x)));

String programCampusResponseModelToJson(
        List<ProgramCampusResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgramCampusResponseModel {
  ProgramCampusResponseModel({
    this.campusId,
    this.campusName,
  });

  int? campusId;
  dynamic? campusName;

  factory ProgramCampusResponseModel.fromJson(Map<String, dynamic> json) =>
      ProgramCampusResponseModel(
        campusId: json["CampusId"],
        campusName: campusNameValues.map[json["CampusName"]],
      );

  Map<String, dynamic> toJson() => {
        "CampusId": campusId,
        "CampusName": campusNameValues.reverse![campusName],
      };
}

enum CampusName { SYDNEY_NOVA_SCOTIA_CANADA }

final campusNameValues = EnumValues(
    {"Sydney Nova Scotia Canada": CampusName.SYDNEY_NOVA_SCOTIA_CANADA});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
