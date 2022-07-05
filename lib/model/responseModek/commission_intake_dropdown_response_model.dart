// To parse this JSON data, do
//
//     final commissionIntakeDropdownResponseModel = commissionIntakeDropdownResponseModelFromJson(jsonString);

import 'dart:convert';

List<CommissionIntakeDropdownResponseModel>
    commissionIntakeDropdownResponseModelFromJson(String str) =>
        List<CommissionIntakeDropdownResponseModel>.from(json
            .decode(str)
            .map((x) => CommissionIntakeDropdownResponseModel.fromJson(x)));

String commissionIntakeDropdownResponseModelToJson(
        List<CommissionIntakeDropdownResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommissionIntakeDropdownResponseModel {
  CommissionIntakeDropdownResponseModel({
    this.intakeGroupId,
    this.intakeName,
  });

  int? intakeGroupId;
  String? intakeName;

  factory CommissionIntakeDropdownResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CommissionIntakeDropdownResponseModel(
        intakeGroupId: json["IntakeGroupId"],
        intakeName: json["IntakeName"],
      );

  Map<String, dynamic> toJson() => {
        "IntakeGroupId": intakeGroupId,
        "IntakeName": intakeName,
      };
}
