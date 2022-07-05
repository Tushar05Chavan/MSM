// To parse this JSON data, do
//
//     final advisorMarketingResponseModel = advisorMarketingResponseModelFromJson(jsonString);

import 'dart:convert';

List<AdvisorMarketingResponseModel> advisorMarketingResponseModelFromJson(
        String str) =>
    List<AdvisorMarketingResponseModel>.from(
        json.decode(str).map((x) => AdvisorMarketingResponseModel.fromJson(x)));

String advisorMarketingResponseModelToJson(
        List<AdvisorMarketingResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvisorMarketingResponseModel {
  AdvisorMarketingResponseModel({
    this.userid,
    this.displayName,
    this.emailId,
  });

  int? userid;
  String? displayName;
  String? emailId;

  factory AdvisorMarketingResponseModel.fromJson(Map<String, dynamic> json) =>
      AdvisorMarketingResponseModel(
        userid: json["Userid"],
        displayName: json["DisplayName"],
        emailId: json["EmailId"],
      );

  Map<String, dynamic> toJson() => {
        "Userid": userid,
        "DisplayName": displayName,
        "EmailId": emailId,
      };
}
