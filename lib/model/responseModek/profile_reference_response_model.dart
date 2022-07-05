// To parse this JSON data, do
//
//     final referenceResponseModel = referenceResponseModelFromJson(jsonString);

import 'dart:convert';

List<ReferenceResponseModel> referenceResponseModelFromJson(String str) =>
    List<ReferenceResponseModel>.from(
        json.decode(str).map((x) => ReferenceResponseModel.fromJson(x)));

String referenceResponseModelToJson(List<ReferenceResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReferenceResponseModel {
  ReferenceResponseModel({
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
  String? refResponse;

  factory ReferenceResponseModel.fromJson(Map<String, dynamic> json) =>
      ReferenceResponseModel(
        refId: json["RefId"],
        name: json["Name"],
        contactNo: json["ContactNo"],
        designation: json["Designation"],
        institution: json["Institution"],
        phoneNo: json["PhoneNo"],
        email: json["Email"],
        isVerified: json["isVerified"] == null ? null : json["isVerified"],
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
        "isVerified": isVerified == null ? null : isVerified,
        "Remark": remark,
        "RefAddress": refAddress,
        "RefResponse": refResponse,
      };
}
