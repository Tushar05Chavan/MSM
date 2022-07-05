// To parse this JSON data, do
//
//     final referOnclickResponseModel = referOnclickResponseModelFromJson(jsonString);

import 'dart:convert';

ReferOnclickResponseModel referOnclickResponseModelFromJson(String str) =>
    ReferOnclickResponseModel.fromJson(json.decode(str));

String referOnclickResponseModelToJson(ReferOnclickResponseModel data) =>
    json.encode(data.toJson());

class ReferOnclickResponseModel {
  ReferOnclickResponseModel({
    this.refId,
    this.name,
    this.contactNo,
    this.designation,
    this.institution,
    this.phoneNo,
    this.email,
    this.isVerified,
    this.remark,
    this.refAddress,
    this.refResponse,
  });

  int? refId;
  String? name;
  dynamic contactNo;
  String? designation;
  String? institution;
  String? phoneNo;
  String? email;
  int? isVerified;
  String? remark;
  String? refAddress;
  int? refResponse;

  factory ReferOnclickResponseModel.fromJson(Map<String, dynamic> json) =>
      ReferOnclickResponseModel(
        refId: json["RefId"],
        name: json["Name"],
        contactNo: json["ContactNo"],
        designation: json["Designation"],
        institution: json["Institution"],
        phoneNo: json["PhoneNo"],
        email: json["Email"],
        isVerified: json["isVerified"],
        remark: json["Remark"],
        refAddress: json["RefAddress"],
        refResponse: json["RefResponse"],
      );

  Map<String, dynamic> toJson() => {
        "RefId": refId,
        "Name": name,
        "ContactNo": contactNo,
        "Designation": designation,
        "Institution": institution,
        "PhoneNo": phoneNo,
        "Email": email,
        "isVerified": isVerified,
        "Remark": remark,
        "RefAddress": refAddress,
        "RefResponse": refResponse,
      };
}
