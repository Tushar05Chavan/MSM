// To parse this JSON data, do
//
//     final languageResponseModel = languageResponseModelFromJson(jsonString);

import 'dart:convert';

List<LanguageResponseModel> languageResponseModelFromJson(String str) =>
    List<LanguageResponseModel>.from(
        json.decode(str).map((x) => LanguageResponseModel.fromJson(x)));

String languageResponseModelToJson(List<LanguageResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LanguageResponseModel {
  LanguageResponseModel({
    this.languageName,
  });

  String? languageName;

  factory LanguageResponseModel.fromJson(Map<String, dynamic> json) =>
      LanguageResponseModel(
        languageName: json["LanguageName"],
      );

  Map<String, dynamic> toJson() => {
        "LanguageName": languageName,
      };
}
