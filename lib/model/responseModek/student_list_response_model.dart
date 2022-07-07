// To parse this JSON data, do
//
//     final studentListResponseModel = studentListResponseModelFromJson(jsonString);

import 'dart:convert';

StudentListResponseModel studentListResponseModelFromJson(String str) =>
    StudentListResponseModel.fromJson(json.decode(str));

String studentListResponseModelToJson(StudentListResponseModel data) =>
    json.encode(data.toJson());

class StudentListResponseModel {
  StudentListResponseModel({
    this.data,
  });

  List<Datum>? data;

  factory StudentListResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentListResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.studentId,
    this.passportNo,
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobileNo,
    this.email,
    this.skypeId,
    this.city,
    this.province,
    this.citizenship,
    this.agent,
    this.status,
    this.addStamp,
    this.numberOfApplication,
  });

  int? studentId;
  String? passportNo;
  String? firstName;
  String? middleName;
  String? lastName;
  String? mobileNo;
  String? email;
  String? skypeId;
  String? city;
  String? province;
  String? citizenship;
  Agent? agent;
  String? status;
  DateTime? addStamp;
  int? numberOfApplication;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        studentId: json["StudentId"],
        passportNo: json["PassportNo"] == null ? null : json["PassportNo"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        mobileNo: json["MobileNo"],
        email: json["Email"],
        skypeId: json["SkypeId"] == null ? null : json["SkypeId"],
        city: json["City"],
        province: json["Province"] == null ? null : json["Province"],
        citizenship: json["Citizenship"],
        agent: agentValues.map[json["Agent"]],
        status: json["Status"],
       // status: statusValues.map[json["Status"]],
        addStamp: DateTime.parse(json["AddStamp"]),
        numberOfApplication: json["NumberOfApplication"],
      );

  Map<String, dynamic> toJson() => {
        "StudentId": studentId,
        "PassportNo": passportNo == null ? null : passportNo,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "MobileNo": mobileNo,
        "Email": email,
        "SkypeId": skypeId == null ? null : skypeId,
        "City": city,
        "Province": province == null ? null : province,
        "Citizenship": citizenship,
        "Agent": agentValues.reverse![agent],
        "Status": statusValues.reverse![status],
        "AddStamp": addStamp!.toIso8601String(),
        "NumberOfApplication": numberOfApplication,
      };
}

enum Agent { EDU_GLOBAL_OVERSEAS }

final agentValues =
    EnumValues({"Edu Global Overseas": Agent.EDU_GLOBAL_OVERSEAS});

enum Status { NOT_APP, APPLIED }

final statusValues =
    EnumValues({"Applied": Status.APPLIED, "Not App": Status.NOT_APP});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
