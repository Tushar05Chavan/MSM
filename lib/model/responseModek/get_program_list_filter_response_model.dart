// To parse this JSON data, do
//
//     final getProgramListFilterResponseModel = getProgramListFilterResponseModelFromJson(jsonString);

import 'dart:convert';

GetProgramListFilterResponseModel getProgramListFilterResponseModelFromJson(
        String str) =>
    GetProgramListFilterResponseModel.fromJson(json.decode(str));

String getProgramListFilterResponseModelToJson(
        GetProgramListFilterResponseModel data) =>
    json.encode(data.toJson());

class GetProgramListFilterResponseModel {
  GetProgramListFilterResponseModel({
    this.institution,
    this.program,
    this.country,
    this.waiverPer,
    this.partnerType,
  });

  List<Institution>? institution;
  List<Program>? program;
  List<Country>? country;
  List<WaiverPer>? waiverPer;
  List<PartnerType>? partnerType;

  factory GetProgramListFilterResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetProgramListFilterResponseModel(
        institution: List<Institution>.from(
            json["Institution"].map((x) => Institution.fromJson(x))),
        program:
            List<Program>.from(json["Program"].map((x) => Program.fromJson(x))),
        country:
            List<Country>.from(json["Country"].map((x) => Country.fromJson(x))),
        waiverPer: List<WaiverPer>.from(
            json["WaiverPer"].map((x) => WaiverPer.fromJson(x))),
        partnerType: List<PartnerType>.from(
            json["PartnerType"].map((x) => PartnerType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Institution": List<dynamic>.from(institution!.map((x) => x.toJson())),
        "Program": List<dynamic>.from(program!.map((x) => x.toJson())),
        "Country": List<dynamic>.from(country!.map((x) => x.toJson())),
        "WaiverPer": List<dynamic>.from(waiverPer!.map((x) => x.toJson())),
        "PartnerType": List<dynamic>.from(partnerType!.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.countryId,
    this.countryName,
  });

  int? countryId;
  String? countryName;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["CountryId"],
        countryName: json["CountryName"],
      );

  Map<String, dynamic> toJson() => {
        "CountryId": countryId,
        "CountryName": countryName,
      };
}

class Institution {
  Institution({
    this.institutionId,
    this.institutionName,
  });

  int? institutionId;
  String? institutionName;

  factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        institutionId: json["InstitutionId"],
        institutionName: json["InstitutionName"],
      );

  Map<String, dynamic> toJson() => {
        "InstitutionId": institutionId,
        "InstitutionName": institutionName,
      };
}

class PartnerType {
  PartnerType({
    this.partnerTypeId,
    this.partnerTypeName,
  });

  int? partnerTypeId;
  String? partnerTypeName;

  factory PartnerType.fromJson(Map<String, dynamic> json) => PartnerType(
        partnerTypeId: json["PartnerTypeId"],
        partnerTypeName: json["PartnerTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "PartnerTypeId": partnerTypeId,
        "PartnerTypeName": partnerTypeName,
      };
}

class Program {
  Program({
    this.programName,
  });

  String? programName;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        programName: json["ProgramName"],
      );

  Map<String, dynamic> toJson() => {
        "ProgramName": programName,
      };
}

class WaiverPer {
  WaiverPer({
    this.waiverPer,
  });

  double? waiverPer;

  factory WaiverPer.fromJson(Map<String, dynamic> json) => WaiverPer(
        waiverPer: json["WaiverPer"],
      );

  Map<String, dynamic> toJson() => {
        "WaiverPer": waiverPer,
      };
}
