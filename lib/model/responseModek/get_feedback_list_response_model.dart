// To parse this JSON data, do
//
//     final getFeedbackListResponseModel = getFeedbackListResponseModelFromJson(jsonString);

import 'dart:convert';

List<GetFeedbackListResponseModel> getFeedbackListResponseModelFromJson(
        String str) =>
    List<GetFeedbackListResponseModel>.from(
        json.decode(str).map((x) => GetFeedbackListResponseModel.fromJson(x)));

String getFeedbackListResponseModelToJson(
        List<GetFeedbackListResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFeedbackListResponseModel {
  GetFeedbackListResponseModel({
    this.feedbackId,
    this.feedbackMessage,
    this.attachmentPath,
    this.userName,
    this.addStamp,
  });

  int? feedbackId;
  String? feedbackMessage;
  String? attachmentPath;
  String? userName;
  DateTime? addStamp;

  factory GetFeedbackListResponseModel.fromJson(Map<String, dynamic> json) =>
      GetFeedbackListResponseModel(
        feedbackId: json["FeedbackId"],
        feedbackMessage: json["FeedbackMessage"],
        attachmentPath: json["AttachmentPath"],
        userName: json["UserName"] == null ? null : json["UserName"],
        addStamp: DateTime.parse(json["AddStamp"]),
      );

  Map<String, dynamic> toJson() => {
        "FeedbackId": feedbackId,
        "FeedbackMessage": feedbackMessage,
        "AttachmentPath": attachmentPath,
        "UserName": userName == null ? null : userName,
        "AddStamp": addStamp!.toIso8601String(),
      };
}
