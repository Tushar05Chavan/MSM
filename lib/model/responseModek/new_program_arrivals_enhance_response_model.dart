// To parse this JSON data, do
//
//     final newProgramArrivalsEnhanceResponseModel = newProgramArrivalsEnhanceResponseModelFromJson(jsonString);

import 'dart:convert';

List<NewProgramArrivalsEnhanceResponseModel>
    newProgramArrivalsEnhanceResponseModelFromJson(String str) =>
        List<NewProgramArrivalsEnhanceResponseModel>.from(json
            .decode(str)
            .map((x) => NewProgramArrivalsEnhanceResponseModel.fromJson(x)));

String newProgramArrivalsEnhanceResponseModelToJson(
        List<NewProgramArrivalsEnhanceResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewProgramArrivalsEnhanceResponseModel {
  NewProgramArrivalsEnhanceResponseModel({
    this.programId,
    this.programName,
    this.eventTitle,
    this.eventDescription,
    this.eventId,
    this.programLevel,
    this.programDiscipline,
    this.instName,
    this.institutionId,
    this.institutionName,
    this.intakeName,
    this.countryName,
    this.durationTime,
    this.instImagePath,
    this.name,
    this.value,
  });

  int? programId;
  String? programName;
  dynamic eventTitle;
  dynamic eventDescription;
  dynamic eventId;
  dynamic programLevel;
  dynamic programDiscipline;
  String? instName;
  dynamic institutionId;
  dynamic institutionName;
  String? intakeName;
  String? countryName;
  String? durationTime;
  dynamic instImagePath;
  dynamic name;
  dynamic value;

  factory NewProgramArrivalsEnhanceResponseModel.fromJson(
          Map<String, dynamic> json) =>
      NewProgramArrivalsEnhanceResponseModel(
        programId: json["ProgramId"],
        programName: json["ProgramName"],
        eventTitle: json["EventTitle"],
        eventDescription: json["EventDescription"],
        eventId: json["EventId"],
        programLevel: json["ProgramLevel"],
        programDiscipline: json["ProgramDiscipline"],
        instName: json["InstName"],
        institutionId: json["InstitutionId"],
        institutionName: json["InstitutionName"],
        intakeName: json["IntakeName"] == null ? null : json["IntakeName"],
        countryName: json["CountryName"] == null ? null : json["CountryName"],
        durationTime: json["DurationTime"],
        instImagePath: json["InstImagePath"],
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "ProgramId": programId,
        "ProgramName": programName,
        "EventTitle": eventTitle,
        "EventDescription": eventDescription,
        "EventId": eventId,
        "ProgramLevel": programLevel,
        "ProgramDiscipline": programDiscipline,
        "InstName": instName,
        "InstitutionId": institutionId,
        "InstitutionName": institutionName,
        "IntakeName": intakeName == null ? null : intakeName,
        "CountryName": countryName == null ? null : countryName,
        "DurationTime": durationTime,
        "InstImagePath": instImagePath,
        "name": name,
        "value": value,
      };
}
