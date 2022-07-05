// To parse this JSON data, do
//
//     final commissionInstitutionResponseModel = commissionInstitutionResponseModelFromJson(jsonString);

import 'dart:convert';

List<CommissionInstitutionResponseModel>
    commissionInstitutionResponseModelFromJson(String str) =>
        List<CommissionInstitutionResponseModel>.from(json
            .decode(str)
            .map((x) => CommissionInstitutionResponseModel.fromJson(x)));

String commissionInstitutionResponseModelToJson(
        List<CommissionInstitutionResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommissionInstitutionResponseModel {
  CommissionInstitutionResponseModel({
    this.instName,
    this.instAlias,
    this.instLogoPath,
    this.instImagePath,
    this.instAddress1,
    this.instAddress2,
    this.instCity,
    this.instProvince,
    this.instCountry,
    this.instZipCode,
    this.instAbout,
    this.instType,
    this.instFounded,
    this.instTotalStudents,
    this.instLocationGeOcode,
    this.instAvgCostTuitionYear,
    this.instCostofLivingYear,
    this.dliNo,
    this.instFeatures,
    this.instApplicationFee,
    this.instCurrency,
    this.website,
    this.localRank,
    this.globalRank,
    this.instVideo,
    this.howToReach,
    this.partnerTypeId,
    this.instTile,
    this.institutionId,
    this.gmoInstitutionOnAbcodo,
    this.openProgramCount,
    this.totalProgramCount,
    this.partnerTypeName,
    this.bannerPath,
  });

  String? instName;
  String? instAlias;
  dynamic instLogoPath;
  dynamic instImagePath;
  dynamic instAddress1;
  dynamic instAddress2;
  dynamic instCity;
  dynamic instProvince;
  dynamic instCountry;
  dynamic instZipCode;
  dynamic instAbout;
  dynamic instType;
  dynamic instFounded;
  dynamic instTotalStudents;
  dynamic instLocationGeOcode;
  dynamic instAvgCostTuitionYear;
  dynamic instCostofLivingYear;
  dynamic dliNo;
  dynamic instFeatures;
  dynamic instApplicationFee;
  dynamic instCurrency;
  dynamic website;
  dynamic localRank;
  dynamic globalRank;
  dynamic instVideo;
  dynamic howToReach;
  int? partnerTypeId;
  dynamic instTile;
  int? institutionId;
  dynamic gmoInstitutionOnAbcodo;
  dynamic openProgramCount;
  dynamic totalProgramCount;
  dynamic partnerTypeName;
  dynamic bannerPath;

  factory CommissionInstitutionResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CommissionInstitutionResponseModel(
        instName: json["InstName"],
        instAlias: json["InstAlias"],
        instLogoPath: json["InstLogoPath"],
        instImagePath: json["InstImagePath"],
        instAddress1: json["InstAddress1"],
        instAddress2: json["InstAddress2"],
        instCity: json["InstCity"],
        instProvince: json["InstProvince"],
        instCountry: json["InstCountry"],
        instZipCode: json["InstZipCode"],
        instAbout: json["InstAbout"],
        instType: json["InstType"],
        instFounded: json["InstFounded"],
        instTotalStudents: json["InstTotalStudents"],
        instLocationGeOcode: json["InstLocationGEOcode"],
        instAvgCostTuitionYear: json["InstAvgCostTuition_Year"],
        instCostofLivingYear: json["InstCostofLiving_Year"],
        dliNo: json["DLINo"],
        instFeatures: json["InstFeatures"],
        instApplicationFee: json["InstApplicationFee"],
        instCurrency: json["InstCurrency"],
        website: json["Website"],
        localRank: json["LocalRank"],
        globalRank: json["GlobalRank"],
        instVideo: json["InstVideo"],
        howToReach: json["HowToReach"],
        partnerTypeId: json["PartnerTypeId"],
        instTile: json["InstTile"],
        institutionId: json["InstitutionId"],
        gmoInstitutionOnAbcodo: json["GMOInstitutionOnAbcodo"],
        openProgramCount: json["OpenProgramCount"],
        totalProgramCount: json["TotalProgramCount"],
        partnerTypeName: json["PartnerTypeName"],
        bannerPath: json["BannerPath"],
      );

  Map<String, dynamic> toJson() => {
        "InstName": instName,
        "InstAlias": instAlias,
        "InstLogoPath": instLogoPath,
        "InstImagePath": instImagePath,
        "InstAddress1": instAddress1,
        "InstAddress2": instAddress2,
        "InstCity": instCity,
        "InstProvince": instProvince,
        "InstCountry": instCountry,
        "InstZipCode": instZipCode,
        "InstAbout": instAbout,
        "InstType": instType,
        "InstFounded": instFounded,
        "InstTotalStudents": instTotalStudents,
        "InstLocationGEOcode": instLocationGeOcode,
        "InstAvgCostTuition_Year": instAvgCostTuitionYear,
        "InstCostofLiving_Year": instCostofLivingYear,
        "DLINo": dliNo,
        "InstFeatures": instFeatures,
        "InstApplicationFee": instApplicationFee,
        "InstCurrency": instCurrency,
        "Website": website,
        "LocalRank": localRank,
        "GlobalRank": globalRank,
        "InstVideo": instVideo,
        "HowToReach": howToReach,
        "PartnerTypeId": partnerTypeId,
        "InstTile": instTile,
        "InstitutionId": institutionId,
        "GMOInstitutionOnAbcodo": gmoInstitutionOnAbcodo,
        "OpenProgramCount": openProgramCount,
        "TotalProgramCount": totalProgramCount,
        "PartnerTypeName": partnerTypeName,
        "BannerPath": bannerPath,
      };
}
