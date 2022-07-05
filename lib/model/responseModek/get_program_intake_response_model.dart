// To parse this JSON data, do
//
//     final getProgramIntake = getProgramIntakeFromJson(jsonString);

import 'dart:convert';

List<GetProgramIntake> getProgramIntakeFromJson(String str) =>
    List<GetProgramIntake>.from(
        json.decode(str).map((x) => GetProgramIntake.fromJson(x)));

String getProgramIntakeToJson(List<GetProgramIntake> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProgramIntake {
  GetProgramIntake({
    this.intekId,
    this.intakeName,
    this.intekDate,
    this.intekStatus,
    this.submissionDeadline,
    this.onshoreSubmissionDeadline,
    this.capacity,
    this.offerLetterTat,
    this.loaTat,
    this.feeReceiveTat,
    this.regionId,
    this.zoneId,
    this.conditionalApplication,
    this.onShore,
    this.offShore,
    this.usedOffShore,
    this.usedOnShore,
    this.campus,
    this.refundTat,
    this.region,
    this.zone,
    this.offshoreSubmissionDeadLine,
  });

  int? intekId;
  String? intakeName;
  DateTime? intekDate;
  String? intekStatus;
  String? submissionDeadline;
  String? onshoreSubmissionDeadline;
  String? capacity;
  String? offerLetterTat;
  String? loaTat;
  String? feeReceiveTat;
  dynamic regionId;
  dynamic zoneId;
  int? conditionalApplication;
  bool? onShore;
  bool? offShore;
  dynamic usedOffShore;
  dynamic usedOnShore;
  dynamic campus;
  dynamic refundTat;
  String? region;
  String? zone;
  String? offshoreSubmissionDeadLine;

  factory GetProgramIntake.fromJson(Map<String, dynamic> json) =>
      GetProgramIntake(
        intekId: json["IntekId"],
        intakeName: json["IntakeName"],
        intekDate: DateTime.parse(json["IntekDate"]),
        intekStatus: json["IntekStatus"],
        submissionDeadline: json["SubmissionDeadline"],
        onshoreSubmissionDeadline: json["OnshoreSubmissionDeadline"],
        capacity: json["Capacity"],
        offerLetterTat: json["OfferLetterTAT"],
        loaTat: json["LOA_TAT"],
        feeReceiveTat: json["FeeReceiveTAT"],
        regionId: json["RegionId"],
        zoneId: json["ZoneId"],
        conditionalApplication: json["ConditionalApplication"],
        onShore: json["OnShore"],
        offShore: json["OffShore"],
        usedOffShore: json["UsedOffShore"],
        usedOnShore: json["UsedOnShore"],
        campus: json["Campus"],
        refundTat: json["RefundTAT"],
        region: json["Region"],
        zone: json["Zone"],
        offshoreSubmissionDeadLine: json["OffshoreSubmissionDeadLine"],
      );

  Map<String, dynamic> toJson() => {
        "IntekId": intekId,
        "IntakeName": intakeName,
        "IntekDate": intekDate!.toIso8601String(),
        "IntekStatus": intekStatus,
        "SubmissionDeadline": submissionDeadline,
        "OnshoreSubmissionDeadline": onshoreSubmissionDeadline,
        "Capacity": capacity,
        "OfferLetterTAT": offerLetterTat,
        "LOA_TAT": loaTat,
        "FeeReceiveTAT": feeReceiveTat,
        "RegionId": regionId,
        "ZoneId": zoneId,
        "ConditionalApplication": conditionalApplication,
        "OnShore": onShore,
        "OffShore": offShore,
        "UsedOffShore": usedOffShore,
        "UsedOnShore": usedOnShore,
        "Campus": campus,
        "RefundTAT": refundTat,
        "Region": region,
        "Zone": zone,
        "OffshoreSubmissionDeadLine": offshoreSubmissionDeadLine,
      };
}
