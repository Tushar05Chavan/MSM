// To parse this JSON data, do
//
//     final intakeInstituteResponseModel = intakeInstituteResponseModelFromJson(jsonString);

import 'dart:convert';

IntakeInstituteResponseModel intakeInstituteResponseModelFromJson(String str) =>
    IntakeInstituteResponseModel.fromJson(json.decode(str));

String intakeInstituteResponseModelToJson(IntakeInstituteResponseModel data) =>
    json.encode(data.toJson());

class IntakeInstituteResponseModel {
  IntakeInstituteResponseModel({
    this.data,
  });

  List<Datum>? data;

  factory IntakeInstituteResponseModel.fromJson(Map<String, dynamic> json) =>
      IntakeInstituteResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.sNo,
    this.institution,
    this.intake,
    this.agentName,
    this.country,
    this.region,
    this.agentZone,
    this.agentCity,
    this.agentState,
    this.applicationCount,
    this.offerLetter,
    this.applicationVSOfferLetterConversion,
    this.tdCount,
    this.offerLetterVSTdConversion,
    this.studyPermitApprovedCount,
    this.studyPermitRefusedCount,
    this.tdFeesVSApprovedStudyPermitConversion,
    this.enrolledCount,
    this.tdFeesVSEnrolledConversion,
  });

  int? sNo;
  String? institution;
  String? intake;
  String? agentName;
  String? country;
  String? region;
  String? agentCity;
  String? agentZone;
  String? agentState;
  int? applicationCount;
  int? offerLetter;
  double? applicationVSOfferLetterConversion;
  int? tdCount;
  double? offerLetterVSTdConversion;
  int? studyPermitApprovedCount;
  int? studyPermitRefusedCount;
  double? tdFeesVSApprovedStudyPermitConversion;
  int? enrolledCount;
  int? tdFeesVSEnrolledConversion;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        sNo: json["S No"],
        institution: json["Institution"],
        intake: json["Intake"],
        agentName: json["Agent name"],
        country: json["Country"],
        region: json["Region"],
        agentZone: json["Agent zone"],
        agentCity: json["Agent city"],
        agentState: json["Agent state"],
        applicationCount: json["Application count"],
        offerLetter: json["Offer letter"],
        applicationVSOfferLetterConversion:
            json["Application v/s Offer letter conversion %"],
        tdCount: json["TD count"],
        offerLetterVSTdConversion: json["Offer letter v/s TD conversion %"],
        studyPermitApprovedCount: json["Study permit approved count"],
        studyPermitRefusedCount: json["Study permit refused count"],
        tdFeesVSApprovedStudyPermitConversion:
            json["TD fees v/s Approved study permit conversion %"],
        enrolledCount: json["Enrolled count"],
        tdFeesVSEnrolledConversion: json["TD fees v/s Enrolled conversion %"],
      );

  Map<String, dynamic> toJson() => {
        "S No": sNo,
        "Institution": institution,
        "Intake": intake,
        "Agent name": agentName,
        "Country": country,
        "Region": region,
        "Agent zone": agentZone,
        "Agent city": agentCity,
        "Agent state": agentState,
        "Application count": applicationCount,
        "Offer letter": offerLetter,
        "Application v/s Offer letter conversion %":
            applicationVSOfferLetterConversion,
        "TD count": tdCount,
        "Offer letter v/s TD conversion %": offerLetterVSTdConversion,
        "Study permit approved count": studyPermitApprovedCount,
        "Study permit refused count": studyPermitRefusedCount,
        "TD fees v/s Approved study permit conversion %":
            tdFeesVSApprovedStudyPermitConversion,
        "Enrolled count": enrolledCount,
        "TD fees v/s Enrolled conversion %": tdFeesVSEnrolledConversion,
      };
}
