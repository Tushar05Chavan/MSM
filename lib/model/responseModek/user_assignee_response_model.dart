// To parse this JSON data, do
//
//     final userAssigneeResponseModel = userAssigneeResponseModelFromJson(jsonString);

import 'dart:convert';

List<UserAssigneeResponseModel> userAssigneeResponseModelFromJson(String str) =>
    List<UserAssigneeResponseModel>.from(
        json.decode(str).map((x) => UserAssigneeResponseModel.fromJson(x)));

String userAssigneeResponseModelToJson(List<UserAssigneeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAssigneeResponseModel {
  UserAssigneeResponseModel({
    this.userId,
    this.displayName,
  });

  int? userId;
  String? displayName;

  factory UserAssigneeResponseModel.fromJson(Map<String, dynamic> json) =>
      UserAssigneeResponseModel(
        userId: json["UserId"],
        displayName: json["DisplayName"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "DisplayName": displayName,
      };
}
