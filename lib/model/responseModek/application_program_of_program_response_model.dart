// To parse this JSON data, do
//
//     final applicationProgramOfProgramResponseModel = applicationProgramOfProgramResponseModelFromJson(jsonString);

import 'dart:convert';

List<ApplicationProgramOfProgramResponseModel>
    applicationProgramOfProgramResponseModelFromJson(String str) =>
        List<ApplicationProgramOfProgramResponseModel>.from(json
            .decode(str)
            .map((x) => ApplicationProgramOfProgramResponseModel.fromJson(x)));

String applicationProgramOfProgramResponseModelToJson(
        List<ApplicationProgramOfProgramResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicationProgramOfProgramResponseModel {
  ApplicationProgramOfProgramResponseModel({
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

  factory ApplicationProgramOfProgramResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ApplicationProgramOfProgramResponseModel(
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
