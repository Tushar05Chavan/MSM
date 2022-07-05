// To parse this JSON data, do
//
//     final gradeResponseModel = gradeResponseModelFromJson(jsonString);

import 'dart:convert';

List<GradeResponseModel> gradeResponseModelFromJson(String str) =>
    List<GradeResponseModel>.from(
        json.decode(str).map((x) => GradeResponseModel.fromJson(x)));

String gradeResponseModelToJson(List<GradeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GradeResponseModel {
  GradeResponseModel({
    this.grdSchemeId,
    this.grdSchemeName,
    this.inputPattern,
    this.inputHint,
    this.countryId,
  });

  int? grdSchemeId;
  String? grdSchemeName;
  String? inputPattern;
  String? inputHint;
  int? countryId;

  factory GradeResponseModel.fromJson(Map<String, dynamic> json) =>
      GradeResponseModel(
        grdSchemeId: json["GrdSchemeId"],
        grdSchemeName: json["GrdSchemeName"],
        inputPattern: json["InputPattern"],
        inputHint: json["InputHint"],
        countryId: json["CountryId"] == null ? null : json["CountryId"],
      );

  Map<String, dynamic> toJson() => {
        "GrdSchemeId": grdSchemeId,
        "GrdSchemeName": grdSchemeName,
        "InputPattern": inputPattern,
        "InputHint": inputHint,
        "CountryId": countryId == null ? null : countryId,
      };
}
