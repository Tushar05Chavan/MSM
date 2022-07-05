// To parse this JSON data, do
//
//     final scholarshipDropResponseModel = scholarshipDropResponseModelFromJson(jsonString);

import 'dart:convert';

ScholarshipDropResponseModel scholarshipDropResponseModelFromJson(String str) =>
    ScholarshipDropResponseModel.fromJson(json.decode(str));

String scholarshipDropResponseModelToJson(ScholarshipDropResponseModel data) =>
    json.encode(data.toJson());

class ScholarshipDropResponseModel {
  ScholarshipDropResponseModel({
    this.institution,
    this.programs,
    this.country,
    this.amtType,
    this.minAmt,
    this.maxAmt,
    this.partnerType,
  });

  List<Institution>? institution;
  List<Program>? programs;
  List<Country>? country;
  List<AmtType>? amtType;
  List<MinAmt>? minAmt;
  List<MaxAmt>? maxAmt;
  List<PartnerType>? partnerType;

  factory ScholarshipDropResponseModel.fromJson(Map<String, dynamic> json) =>
      ScholarshipDropResponseModel(
        institution: List<Institution>.from(
            json["Institution"].map((x) => Institution.fromJson(x))),
        programs: List<Program>.from(
            json["Programs"].map((x) => Program.fromJson(x))),
        country:
            List<Country>.from(json["Country"].map((x) => Country.fromJson(x))),
        amtType:
            List<AmtType>.from(json["AmtType"].map((x) => AmtType.fromJson(x))),
        minAmt:
            List<MinAmt>.from(json["MinAmt"].map((x) => MinAmt.fromJson(x))),
        maxAmt:
            List<MaxAmt>.from(json["MaxAmt"].map((x) => MaxAmt.fromJson(x))),
        partnerType: List<PartnerType>.from(
            json["PartnerType"].map((x) => PartnerType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Institution": List<dynamic>.from(institution!.map((x) => x.toJson())),
        "Programs": List<dynamic>.from(programs!.map((x) => x.toJson())),
        "Country": List<dynamic>.from(country!.map((x) => x.toJson())),
        "AmtType": List<dynamic>.from(amtType!.map((x) => x.toJson())),
        "MinAmt": List<dynamic>.from(minAmt!.map((x) => x.toJson())),
        "MaxAmt": List<dynamic>.from(maxAmt!.map((x) => x.toJson())),
        "PartnerType": List<dynamic>.from(partnerType!.map((x) => x.toJson())),
      };
}

class AmtType {
  AmtType({
    this.amtType,
    this.amtTypeName,
  });

  int? amtType;
  String? amtTypeName;

  factory AmtType.fromJson(Map<String, dynamic> json) => AmtType(
        amtType: json["AmtType"],
        amtTypeName: json["AmtTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "AmtType": amtType,
        "AmtTypeName": amtTypeName,
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

class MaxAmt {
  MaxAmt({
    this.maxAmt,
  });

  double? maxAmt;

  factory MaxAmt.fromJson(Map<String, dynamic> json) => MaxAmt(
        maxAmt: json["MaxAmt"],
      );

  Map<String, dynamic> toJson() => {
        "MaxAmt": maxAmt,
      };
}

class MinAmt {
  MinAmt({
    this.minAmt,
  });

  double? minAmt;

  factory MinAmt.fromJson(Map<String, dynamic> json) => MinAmt(
        minAmt: json["MinAmt"],
      );

  Map<String, dynamic> toJson() => {
        "MinAmt": minAmt,
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
