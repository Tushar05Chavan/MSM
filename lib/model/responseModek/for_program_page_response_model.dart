// To parse this JSON data, do
//
//     final forProgramPageResponseModel = forProgramPageResponseModelFromJson(jsonString);

import 'dart:convert';

ForProgramPageResponseModel forProgramPageResponseModelFromJson(String str) =>
    ForProgramPageResponseModel.fromJson(json.decode(str));

String forProgramPageResponseModelToJson(ForProgramPageResponseModel data) =>
    json.encode(data.toJson());

class ForProgramPageResponseModel {
  ForProgramPageResponseModel({
    this.programId,
    this.programName,
    this.programStatus,
    this.durationTime,
    this.durationType,
    this.noOfSemester,
    this.globalRank,
    this.localRank,
    this.instituteAbout,
    this.instAddress,
    this.programDuration,
    this.applicationFee,
    this.instTile,
    this.instCountryId,
    this.specializationName,
    this.campusName,
    this.levelOfEducation,
    this.instLocationGeOcode,
    this.isViaAbcodo,
    this.offerLetterTat,
    this.programCurrency,
    this.programLevel,
    this.programLink,
    this.description,
    this.averageProcessingDay,
    this.instName,
    this.instImagePath,
    this.instLogoPath,
    this.eduLevelName,
    this.instCostofLivingYear,
    this.onCampus,
    this.offCampus,
    this.homeStay,
    this.postGraduateWithWork,
    this.programWithCoOpOption,
    this.conditionalOfferLetter,
    this.workWhileStudy,
    this.institutionId,
    this.partnerTypeId,
    this.inteks,
    this.englishRequirement,
    this.subjectRequirement,
    this.accadmicRequirement,
    this.documentRequirement,
    this.feeDetail,
    this.additionalRequirement,
  });

  int? programId;
  String? programName;
  String? programStatus;
  String? durationTime;
  int? durationType;
  dynamic noOfSemester;
  dynamic globalRank;
  dynamic localRank;
  String? instituteAbout;
  String? instAddress;
  String? programDuration;
  double? applicationFee;
  String? instTile;
  int? instCountryId;
  String? specializationName;
  String? campusName;
  String? levelOfEducation;
  String? instLocationGeOcode;
  int? isViaAbcodo;
  dynamic offerLetterTat;
  String? programCurrency;
  dynamic programLevel;
  dynamic programLink;
  String? description;
  String? averageProcessingDay;
  String? instName;
  String? instImagePath;
  String? instLogoPath;
  dynamic eduLevelName;
  String? instCostofLivingYear;
  dynamic onCampus;
  dynamic offCampus;
  dynamic homeStay;
  dynamic postGraduateWithWork;
  dynamic programWithCoOpOption;
  dynamic conditionalOfferLetter;
  dynamic workWhileStudy;
  int? institutionId;
  int? partnerTypeId;
  List<Intek>? inteks;
  List<dynamic>? englishRequirement;
  List<dynamic>? subjectRequirement;
  List<dynamic>? accadmicRequirement;
  List<dynamic>? documentRequirement;
  List<FeeDetail>? feeDetail;
  List<dynamic>? additionalRequirement;

  factory ForProgramPageResponseModel.fromJson(Map<String, dynamic> json) =>
      ForProgramPageResponseModel(
        programId: json["ProgramId"],
        programName: json["ProgramName"],
        programStatus: json["ProgramStatus"],
        durationTime: json["DurationTime"],
        durationType: json["DurationType"],
        noOfSemester: json["NoOfSemester"],
        globalRank: json["GlobalRank"],
        localRank: json["LocalRank"],
        instituteAbout: json["InstituteAbout"],
        instAddress: json["InstAddress"],
        programDuration: json["ProgramDuration"],
        applicationFee: json["ApplicationFee"],
        instTile: json["InstTile"],
        instCountryId: json["InstCountryId"],
        specializationName: json["SpecializationName"],
        campusName: json["CampusName"],
        levelOfEducation: json["LevelOfEducation"],
        instLocationGeOcode: json["InstLocationGEOcode"],
        isViaAbcodo: json["isViaAbcodo"],
        offerLetterTat: json["OfferLetterTAT"],
        programCurrency: json["ProgramCurrency"],
        programLevel: json["ProgramLevel"],
        programLink: json["ProgramLink"],
        description: json["Description"],
        averageProcessingDay: json["AverageProcessingDay"],
        instName: json["InstName"],
        instImagePath: json["InstImagePath"],
        instLogoPath: json["InstLogoPath"],
        eduLevelName: json["EduLevelName"],
        instCostofLivingYear: json["InstCostofLiving_Year"],
        onCampus: json["onCampus"],
        offCampus: json["offCampus"],
        homeStay: json["homeStay"],
        postGraduateWithWork: json["postGraduateWithWork"],
        programWithCoOpOption: json["programWithCoOpOption"],
        conditionalOfferLetter: json["conditionalOfferLetter"],
        workWhileStudy: json["workWhileStudy"],
        institutionId: json["InstitutionId"],
        partnerTypeId: json["PartnerTypeId"],
        inteks: List<Intek>.from(json["Inteks"].map((x) => Intek.fromJson(x))),
        englishRequirement:
            List<dynamic>.from(json["EnglishRequirement"].map((x) => x)),
        subjectRequirement:
            List<dynamic>.from(json["SubjectRequirement"].map((x) => x)),
        accadmicRequirement:
            List<dynamic>.from(json["AccadmicRequirement"].map((x) => x)),
        documentRequirement:
            List<dynamic>.from(json["DocumentRequirement"].map((x) => x)),
        feeDetail: List<FeeDetail>.from(
            json["FeeDetail"].map((x) => FeeDetail.fromJson(x))),
        additionalRequirement:
            List<dynamic>.from(json["AdditionalRequirement"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ProgramId": programId,
        "ProgramName": programName,
        "ProgramStatus": programStatus,
        "DurationTime": durationTime,
        "DurationType": durationType,
        "NoOfSemester": noOfSemester,
        "GlobalRank": globalRank,
        "LocalRank": localRank,
        "InstituteAbout": instituteAbout,
        "InstAddress": instAddress,
        "ProgramDuration": programDuration,
        "ApplicationFee": applicationFee,
        "InstTile": instTile,
        "InstCountryId": instCountryId,
        "SpecializationName": specializationName,
        "CampusName": campusName,
        "LevelOfEducation": levelOfEducation,
        "InstLocationGEOcode": instLocationGeOcode,
        "isViaAbcodo": isViaAbcodo,
        "OfferLetterTAT": offerLetterTat,
        "ProgramCurrency": programCurrency,
        "ProgramLevel": programLevel,
        "ProgramLink": programLink,
        "Description": description,
        "AverageProcessingDay": averageProcessingDay,
        "InstName": instName,
        "InstImagePath": instImagePath,
        "InstLogoPath": instLogoPath,
        "EduLevelName": eduLevelName,
        "InstCostofLiving_Year": instCostofLivingYear,
        "onCampus": onCampus,
        "offCampus": offCampus,
        "homeStay": homeStay,
        "postGraduateWithWork": postGraduateWithWork,
        "programWithCoOpOption": programWithCoOpOption,
        "conditionalOfferLetter": conditionalOfferLetter,
        "workWhileStudy": workWhileStudy,
        "InstitutionId": institutionId,
        "PartnerTypeId": partnerTypeId,
        "Inteks": List<dynamic>.from(inteks!.map((x) => x.toJson())),
        "EnglishRequirement":
            List<dynamic>.from(englishRequirement!.map((x) => x)),
        "SubjectRequirement":
            List<dynamic>.from(subjectRequirement!.map((x) => x)),
        "AccadmicRequirement":
            List<dynamic>.from(accadmicRequirement!.map((x) => x)),
        "DocumentRequirement":
            List<dynamic>.from(documentRequirement!.map((x) => x)),
        "FeeDetail": List<dynamic>.from(feeDetail!.map((x) => x.toJson())),
        "AdditionalRequirement":
            List<dynamic>.from(additionalRequirement!.map((x) => x)),
      };
}

class FeeDetail {
  FeeDetail({
    this.feeId,
    this.feeType,
    this.feeBasis,
    this.feeAmount,
    this.actualFee,
  });

  int? feeId;
  String? feeType;
  String? feeBasis;
  int? feeAmount;
  String? actualFee;

  factory FeeDetail.fromJson(Map<String, dynamic> json) => FeeDetail(
        feeId: json["FeeId"],
        feeType: json["FeeType"],
        feeBasis: json["FeeBasis"],
        feeAmount: json["FeeAmount"],
        actualFee: json["ActualFee"],
      );

  Map<String, dynamic> toJson() => {
        "FeeId": feeId,
        "FeeType": feeType,
        "FeeBasis": feeBasis,
        "FeeAmount": feeAmount,
        "ActualFee": actualFee,
      };
}

class Intek {
  Intek({
    this.intekId,
    this.intakeName,
    this.statusName,
    this.intekDate,
    this.submissionDeadline,
    this.onShore,
    this.offShore,
    this.onshoreSubmissionDeadline,
    this.intekStatus,
  });

  int? intekId;
  String? intakeName;
  dynamic statusName;
  DateTime? intekDate;
  String? submissionDeadline;
  dynamic onShore;
  dynamic offShore;
  dynamic onshoreSubmissionDeadline;
  String? intekStatus;

  factory Intek.fromJson(Map<String, dynamic> json) => Intek(
        intekId: json["IntekId"],
        intakeName: json["IntakeName"],
        statusName: json["StatusName"],
        intekDate: DateTime.parse(json["IntekDate"]),
        submissionDeadline: json["SubmissionDeadline"],
        onShore: json["OnShore"],
        offShore: json["OffShore"],
        onshoreSubmissionDeadline: json["OnshoreSubmissionDeadline"],
        intekStatus: json["IntekStatus"],
      );

  Map<String, dynamic> toJson() => {
        "IntekId": intekId,
        "IntakeName": intakeName,
        "StatusName": statusName,
        "IntekDate": intekDate!.toIso8601String(),
        "SubmissionDeadline": submissionDeadline,
        "OnShore": onShore,
        "OffShore": offShore,
        "OnshoreSubmissionDeadline": onshoreSubmissionDeadline,
        "IntekStatus": intekStatus,
      };
}
