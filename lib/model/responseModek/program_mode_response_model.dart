// To parse this JSON data, do
//
//     final programModeResponseModel = programModeResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProgramModeResponseModel> programModeResponseModelFromJson(String str) =>
    List<ProgramModeResponseModel>.from(
        json.decode(str).map((x) => ProgramModeResponseModel.fromJson(x)));

String programModeResponseModelToJson(List<ProgramModeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgramModeResponseModel {
  ProgramModeResponseModel({
    this.modeId,
    this.modeName,
  });

  int? modeId;
  String? modeName;

  factory ProgramModeResponseModel.fromJson(Map<String, dynamic> json) =>
      ProgramModeResponseModel(
        modeId: json["ModeId"],
        modeName: json["ModeName"],
      );

  Map<String, dynamic> toJson() => {
        "ModeId": modeId,
        "ModeName": modeName,
      };
}
