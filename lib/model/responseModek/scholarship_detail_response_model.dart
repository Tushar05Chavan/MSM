// To parse this JSON data, do
//
//     final scholarshipdetailResponseModel = scholarshipdetailResponseModelFromJson(jsonString);

import 'dart:convert';

List<ScholarshipdetailResponseModel> scholarshipdetailResponseModelFromJson(
        String str) =>
    List<ScholarshipdetailResponseModel>.from(json
        .decode(str)
        .map((x) => ScholarshipdetailResponseModel.fromJson(x)));

String scholarshipdetailResponseModelToJson(
        List<ScholarshipdetailResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScholarshipdetailResponseModel {
  ScholarshipdetailResponseModel({
    this.institutionId,
    this.instName,
    this.instLogoPath,
    this.instCountry,
    this.instProvince,
    this.instCity,
    this.commission,
    this.partnerTypeId,
    this.instTile,
    this.isViaAbcodo,
    this.instCategoryId,
    this.programs,
  });

  int? institutionId;
  String? instName;
  String? instLogoPath;
  String? instCountry;
  String? instProvince;
  String? instCity;
  double? commission;
  int? partnerTypeId;
  String? instTile;
  int? isViaAbcodo;
  int? instCategoryId;
  List<Program>? programs;

  factory ScholarshipdetailResponseModel.fromJson(Map<String, dynamic> json) =>
      ScholarshipdetailResponseModel(
        institutionId: json["InstitutionId"],
        instName: json["InstName"],
        instLogoPath: json["InstLogoPath"],
        instCountry: json["InstCountry"],
        instProvince: json["InstProvince"],
        instCity: json["InstCity"],
        commission: json["Commission"],
        partnerTypeId: json["PartnerTypeId"],
        instTile: json["InstTile"] == null ? null : json["InstTile"],
        isViaAbcodo: json["isViaAbcodo"],
        instCategoryId: json["InstCategoryId"],
        programs: List<Program>.from(
            json["programs"].map((x) => Program.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "InstitutionId": institutionId,
        "InstName": instName,
        "InstLogoPath": instLogoPath,
        "InstCountry": instCountry,
        "InstProvince": instProvince,
        "InstCity": instCity,
        "Commission": commission,
        "PartnerTypeId": partnerTypeId,
        "InstTile": instTile == null ? null : instTile,
        "isViaAbcodo": isViaAbcodo,
        "InstCategoryId": instCategoryId,
        "programs": List<dynamic>.from(programs!.map((x) => x.toJson())),
      };
}

class Program {
  Program({
    this.programId,
    this.programName,
    this.durationTime,
    this.durationType,
    this.noOfSemester,
    this.offerLetterTat,
    this.programCurrency,
    this.programLevel,
    this.programLink,
    this.averageProcessingDay,
    this.programStatus,
    this.waiverPer,
    this.applicationFee,
    this.applicationFeeAfterWaiver,
    this.scholarShipAmtType,
    this.scholarShipAmtTypeName,
    this.scholarShipMinAmt,
    this.scholarShipMaxAmt,
    this.institutionName,
    this.partnerTypeName,
    this.startDate,
    this.endDate,
    this.campus,
    this.feeDetail,
    this.intakes,
  });

  int? programId;
  String? programName;
  String? durationTime;
  int? durationType;
  int? noOfSemester;
  String? offerLetterTat;
  String? programCurrency;
  String? programLevel;
  String? programLink;
  String? averageProcessingDay;
  String? programStatus;
  double? waiverPer;
  double? applicationFee;
  String? applicationFeeAfterWaiver;
  int? scholarShipAmtType;
  String? scholarShipAmtTypeName;
  double? scholarShipMinAmt;
  double? scholarShipMaxAmt;
  String? institutionName;
  String? partnerTypeName;
  DateTime? startDate;
  DateTime? endDate;
  List<Campus>? campus;
  List<FeeDetail>? feeDetail;
  List<Intake>? intakes;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        programId: json["ProgramId"],
        programName: json["ProgramName"],
        durationTime: json["DurationTime"],
        durationType: json["DurationType"],
        noOfSemester: json["NoOfSemester"],
        offerLetterTat: json["OfferLetterTAT"],
        programCurrency: json["ProgramCurrency"],
        programLevel: json["ProgramLevel"],
        programLink: json["ProgramLink"],
        averageProcessingDay: json["AverageProcessingDay"],
        programStatus: json["ProgramStatus"],
        waiverPer: json["WaiverPer"] == null ? null : json["WaiverPer"],
        applicationFee:
            json["ApplicationFee"] == null ? null : json["ApplicationFee"],
        applicationFeeAfterWaiver: json["ApplicationFeeAfterWaiver"] == null
            ? null
            : json["ApplicationFeeAfterWaiver"],
        scholarShipAmtType: json["ScholarShipAmtType"],
        scholarShipAmtTypeName: json["ScholarShipAmtTypeName"],
        scholarShipMinAmt: json["ScholarShipMinAmt"],
        scholarShipMaxAmt: json["ScholarShipMaxAmt"],
        institutionName: json["InstitutionName"],
        partnerTypeName: json["PartnerTypeName"],
        startDate: DateTime.parse(json["StartDate"]),
        endDate: DateTime.parse(json["EndDate"]),
        campus:
            List<Campus>.from(json["campus"].map((x) => Campus.fromJson(x))),
        feeDetail: List<FeeDetail>.from(
            json["FeeDetail"].map((x) => FeeDetail.fromJson(x))),
        intakes:
            List<Intake>.from(json["Intakes"].map((x) => Intake.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ProgramId": programId,
        "ProgramName": programName,
        "DurationTime": durationTime,
        "DurationType": durationType,
        "NoOfSemester": noOfSemester,
        "OfferLetterTAT": offerLetterTat,
        "ProgramCurrency": programCurrency,
        "ProgramLevel": programLevel,
        "ProgramLink": programLink,
        "AverageProcessingDay": averageProcessingDay,
        "ProgramStatus": programStatus,
        "WaiverPer": waiverPer == null ? null : waiverPer,
        "ApplicationFee": applicationFee == null ? null : applicationFee,
        "ApplicationFeeAfterWaiver": applicationFeeAfterWaiver == null
            ? null
            : applicationFeeAfterWaiver,
        "ScholarShipAmtType": scholarShipAmtType,
        "ScholarShipAmtTypeName": scholarShipAmtTypeName,
        "ScholarShipMinAmt": scholarShipMinAmt,
        "ScholarShipMaxAmt": scholarShipMaxAmt,
        "InstitutionName": institutionName,
        "PartnerTypeName": partnerTypeName,
        "StartDate": startDate!.toIso8601String(),
        "EndDate": endDate!.toIso8601String(),
        "campus": List<dynamic>.from(campus!.map((x) => x.toJson())),
        "FeeDetail": List<dynamic>.from(feeDetail!.map((x) => x.toJson())),
        "Intakes": List<dynamic>.from(intakes!.map((x) => x.toJson())),
      };
}

class Campus {
  Campus({
    this.campusName,
    this.city,
    this.countryName,
  });

  String? campusName;
  String? city;
  String? countryName;

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        campusName: json["CampusName"],
        city: json["City"],
        countryName: json["CountryName"],
      );

  Map<String, dynamic> toJson() => {
        "CampusName": campusName,
        "City": city,
        "CountryName": countryName,
      };
}

class FeeDetail {
  FeeDetail({
    this.feeId,
    this.feeType,
    this.feeBasis,
    this.feeAmount,
    this.region,
    this.actualFee,
  });

  int? feeId;
  String? feeType;
  String? feeBasis;
  double? feeAmount;
  String? region;
  String? actualFee;

  factory FeeDetail.fromJson(Map<String, dynamic> json) => FeeDetail(
        feeId: json["FeeId"],
        feeType: json["FeeType"],
        feeBasis: json["FeeBasis"],
        feeAmount: json["FeeAmount"],
        region: json["Region"],
        actualFee: json["ActualFee"],
      );

  Map<String, dynamic> toJson() => {
        "FeeId": feeId,
        "FeeType": feeType,
        "FeeBasis": feeBasis,
        "FeeAmount": feeAmount,
        "Region": region,
        "ActualFee": actualFee,
      };
}

class Intake {
  Intake({
    this.intakeName,
    this.statusName,
  });

  String? intakeName;
  String? statusName;

  factory Intake.fromJson(Map<String, dynamic> json) => Intake(
        intakeName: json["IntakeName"],
        statusName: json["StatusName"],
      );

  Map<String, dynamic> toJson() => {
        "IntakeName": intakeName,
        "StatusName": statusName,
      };
}
