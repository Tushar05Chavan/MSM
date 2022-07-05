// To parse this JSON data, do
//
//     final feeResponseModel = feeResponseModelFromJson(jsonString);

import 'dart:convert';

List<FeeResponseModel> feeResponseModelFromJson(String str) =>
    List<FeeResponseModel>.from(
        json.decode(str).map((x) => FeeResponseModel.fromJson(x)));

String feeResponseModelToJson(List<FeeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeeResponseModel {
  FeeResponseModel({
    this.feeId,
    this.feeBasis,
    this.feeType,
    this.feeAmount,
    this.region,
    this.deadline,
    this.intake,
    this.tat,
    this.isRefundable,
    this.regionId,
    this.intakeId,
    this.fullAmount,
    this.couponId,
    this.couponPer,
    this.waiverAmt,
  });

  int? feeId;
  String? feeBasis;
  String? feeType;
  int? feeAmount;
  dynamic region;
  dynamic deadline;
  dynamic intake;
  dynamic tat;
  dynamic isRefundable;
  dynamic regionId;
  dynamic intakeId;
  int? fullAmount;
  int? couponId;
  int? couponPer;
  dynamic waiverAmt;

  factory FeeResponseModel.fromJson(Map<String, dynamic> json) =>
      FeeResponseModel(
        feeId: json["FeeId"],
        feeBasis: json["FeeBasis"],
        feeType: json["FeeType"],
        feeAmount: json["FeeAmount"],
        region: json["Region"],
        deadline: json["Deadline"],
        intake: json["Intake"],
        tat: json["TAT"],
        isRefundable: json["isRefundable"],
        regionId: json["RegionId"],
        intakeId: json["IntakeId"],
        fullAmount: json["FullAmount"],
        couponId: json["CouponId"] == null ? null : json["CouponId"],
        couponPer: json["CouponPer"] == null ? null : json["CouponPer"],
        waiverAmt: json["WaiverAmt"],
      );

  Map<String, dynamic> toJson() => {
        "FeeId": feeId,
        "FeeBasis": feeBasis,
        "FeeType": feeType,
        "FeeAmount": feeAmount,
        "Region": region,
        "Deadline": deadline,
        "Intake": intake,
        "TAT": tat,
        "isRefundable": isRefundable,
        "RegionId": regionId,
        "IntakeId": intakeId,
        "FullAmount": fullAmount,
        "CouponId": couponId == null ? null : couponId,
        "CouponPer": couponPer == null ? null : couponPer,
        "WaiverAmt": waiverAmt,
      };
}
