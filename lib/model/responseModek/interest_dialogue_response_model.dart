// To parse this JSON data, do
//
//     final instituteDialogueResponseModel = instituteDialogueResponseModelFromJson(jsonString);

import 'dart:convert';

List<InstituteDialogueResponseModel> instituteDialogueResponseModelFromJson(
        String str) =>
    List<InstituteDialogueResponseModel>.from(json
        .decode(str)
        .map((x) => InstituteDialogueResponseModel.fromJson(x)));

String instituteDialogueResponseModelToJson(
        List<InstituteDialogueResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InstituteDialogueResponseModel {
  InstituteDialogueResponseModel({
    this.programId,
    this.programName,
    this.onShore,
    this.offShore,
    this.selected,
    this.programCampus,
  });

  int? programId;
  String? programName;
  bool? onShore;
  bool? offShore;
  bool? selected;
  dynamic programCampus;

  factory InstituteDialogueResponseModel.fromJson(Map<String, dynamic> json) =>
      InstituteDialogueResponseModel(
        programId: json["ProgramId"],
        programName: json["ProgramName"],
        onShore: json["OnShore"],
        offShore: json["OffShore"],
        selected: json["Selected"],
        programCampus: json["ProgramCampus"],
      );

  Map<String, dynamic> toJson() => {
        "ProgramId": programId,
        "ProgramName": programName,
        "OnShore": onShore,
        "OffShore": offShore,
        "Selected": selected,
        "ProgramCampus": programCampus,
      };
}
