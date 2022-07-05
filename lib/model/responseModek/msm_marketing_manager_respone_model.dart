// To parse this JSON data, do
//
//     final msmMarketingManagerResponseModel = msmMarketingManagerResponseModelFromJson(jsonString);

import 'dart:convert';

List<MsmMarketingManagerResponseModel> msmMarketingManagerResponseModelFromJson(
        String str) =>
    List<MsmMarketingManagerResponseModel>.from(json
        .decode(str)
        .map((x) => MsmMarketingManagerResponseModel.fromJson(x)));

String msmMarketingManagerResponseModelToJson(
        List<MsmMarketingManagerResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MsmMarketingManagerResponseModel {
  MsmMarketingManagerResponseModel({
    this.userid,
    this.displayName,
    this.emailId,
  });

  int? userid;
  String? displayName;
  String? emailId;

  factory MsmMarketingManagerResponseModel.fromJson(
          Map<String, dynamic> json) =>
      MsmMarketingManagerResponseModel(
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
