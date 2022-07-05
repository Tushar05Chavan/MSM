// To parse this JSON data, do
//
//     final statusLogResponseModel = statusLogResponseModelFromJson(jsonString);

import 'dart:convert';

List<StatusLogResponseModel> statusLogResponseModelFromJson(String str) =>
    List<StatusLogResponseModel>.from(
        json.decode(str).map((x) => StatusLogResponseModel.fromJson(x)));

String statusLogResponseModelToJson(List<StatusLogResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatusLogResponseModel {
  StatusLogResponseModel({
    this.transactionId,
    this.activityStatus,
    this.activityUser,
    this.activityStamp,
    this.activityRemark,
    this.displayName,
    this.activityPriority,
    this.statusId,
    this.profileImage,
    this.intake,
  });

  int? transactionId;
  String? activityStatus;
  String? activityUser;
  DateTime? activityStamp;
  String? activityRemark;
  String? displayName;
  String? activityPriority;
  String? statusId;
  String? profileImage;
  String? intake;

  factory StatusLogResponseModel.fromJson(Map<String, dynamic> json) =>
      StatusLogResponseModel(
        transactionId: json["TransactionId"],
        activityStatus: json["ActivityStatus"],
        activityUser: json["ActivityUser"],
        activityStamp: DateTime.parse(json["ActivityStamp"]),
        activityRemark: json["ActivityRemark"],
        displayName: json["DisplayName"],
        activityPriority: json["ActivityPriority"],
        statusId: json["StatusId"],
        profileImage: json["ProfileImage"],
        intake: json["Intake"],
      );

  Map<String, dynamic> toJson() => {
        "TransactionId": transactionId,
        "ActivityStatus": activityStatus,
        "ActivityUser": activityUser,
        "ActivityStamp": activityStamp!.toIso8601String(),
        "ActivityRemark": activityRemark,
        "DisplayName": displayName,
        "ActivityPriority": activityPriority,
        "StatusId": statusId,
        "ProfileImage": profileImage,
        "Intake": intake,
      };
}
