// To parse this JSON data, do
//
//     final getStudentNotesResponseModel = getStudentNotesResponseModelFromJson(jsonString);

import 'dart:convert';

List<GetStudentNotesResponseModel> getStudentNotesResponseModelFromJson(String str) => List<GetStudentNotesResponseModel>.from(json.decode(str).map((x) => GetStudentNotesResponseModel.fromJson(x)));

String getStudentNotesResponseModelToJson(List<GetStudentNotesResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudentNotesResponseModel {
    GetStudentNotesResponseModel({
        required this.transactionId,
        required this.activityStatus,
        required this.activityUser,
        required this.activityStamp,
        required this.activityRemark,
        required this.displayName,
        required this.activityPriority,
        required this.statusId,
        required this.profileImage,
        required this.intake,
    });

    int transactionId;
    String activityStatus;
    String activityUser;
    DateTime activityStamp;
    String activityRemark;
    String displayName;
    String activityPriority;
    String statusId;
    String profileImage;
    String intake;

    factory GetStudentNotesResponseModel.fromJson(Map<String, dynamic> json) => GetStudentNotesResponseModel(
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
        "ActivityStamp": activityStamp.toIso8601String(),
        "ActivityRemark": activityRemark,
        "DisplayName": displayName,
        "ActivityPriority": activityPriority,
        "StatusId": statusId,
        "ProfileImage": profileImage,
        "Intake": intake,
    };
}
