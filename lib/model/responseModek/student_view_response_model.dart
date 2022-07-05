// To parse this JSON data, do
//
//     final studentViewResponseModel = studentViewResponseModelFromJson(jsonString);

import 'dart:convert';

StudentViewResponseModel studentViewResponseModelFromJson(String str) =>
    StudentViewResponseModel.fromJson(json.decode(str));

String studentViewResponseModelToJson(StudentViewResponseModel data) =>
    json.encode(data.toJson());

class StudentViewResponseModel {
  StudentViewResponseModel({
    this.genInfo,
    this.eduInfo,
    this.testScore,
  });

  GenInfo? genInfo;
  EduInfo? eduInfo;
  TestScore? testScore;

  factory StudentViewResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentViewResponseModel(
        genInfo: GenInfo.fromJson(json["genInfo"]),
        eduInfo: EduInfo.fromJson(json["eduInfo"]),
        testScore: TestScore.fromJson(json["testScore"]),
      );

  Map<String, dynamic> toJson() => {
        "genInfo": genInfo!.toJson(),
        "eduInfo": eduInfo!.toJson(),
        "testScore": testScore!.toJson(),
      };
}

class EduInfo {
  EduInfo({
    this.countryOfEducationName,
    this.highestLevelOfEducationName,
    this.gradingSchemeName,
    this.gradeAverage,
  });

  dynamic countryOfEducationName;
  dynamic highestLevelOfEducationName;
  dynamic gradingSchemeName;
  String? gradeAverage;

  factory EduInfo.fromJson(Map<String, dynamic> json) => EduInfo(
        countryOfEducationName: json["CountryOfEducationName"],
        highestLevelOfEducationName: json["HighestLevelOfEducationName"],
        gradingSchemeName: json["GradingSchemeName"],
        gradeAverage: json["GradeAverage"],
      );

  Map<String, dynamic> toJson() => {
        "CountryOfEducationName": countryOfEducationName,
        "HighestLevelOfEducationName": highestLevelOfEducationName,
        "GradingSchemeName": gradingSchemeName,
        "GradeAverage": gradeAverage,
      };
}

class GenInfo {
  GenInfo({
    this.studentId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.addres,
    this.city,
    this.province,
    this.countryName,
    this.pincode,
    this.mobileNo,
    this.email,
    this.maritialStatus,
    this.language,
    this.citizenshipName,
    this.passportNo,
    this.agentName,
    this.passportExpiryDate,
    this.salution,
    this.mailingAddres,
    this.mailingCity,
    this.mailingProvince,
    this.mailingCountryName,
    this.mailingPincode,
    this.emrgencyName,
    this.emergencyEmail,
    this.emergencyRelation,
    this.emergencyHomePhone,
    this.emergencyCellPhone,
    this.emergencyBusinessPhone,
    this.emergencyAddress,
    this.emergencyCity,
    this.emergencyProvince,
    this.emergencyCountryName,
    this.emergencyPincode,
    this.citizenship,
    this.agentId,
    this.leadSource,
    this.leadStatus,
    this.houseNumber,
    this.streetName,
    this.area,
    this.mobileNoCountryCode,
    this.emergencyHomePhoneCountryCode,
    this.emergencyCellPhoneCountryCode,
    this.emergencyBusinessPhoneCountryCode,
  });

  int? studentId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  DateTime? dateOfBirth;
  String? addres;
  String? city;
  String? province;
  String? countryName;
  String? pincode;
  String? mobileNo;
  String? email;
  String? maritialStatus;
  String? language;
  String? citizenshipName;
  String? passportNo;
  String? agentName;
  DateTime? passportExpiryDate;
  String? salution;
  String? mailingAddres;
  String? mailingCity;
  String? mailingProvince;
  String? mailingCountryName;
  String? mailingPincode;
  String? emrgencyName;
  String? emergencyEmail;
  String? emergencyRelation;
  String? emergencyHomePhone;
  String? emergencyCellPhone;
  String? emergencyBusinessPhone;
  String? emergencyAddress;
  String? emergencyCity;
  String? emergencyProvince;
  dynamic emergencyCountryName;
  String? emergencyPincode;
  int? citizenship;
  int? agentId;
  dynamic leadSource;
  dynamic leadStatus;
  String? houseNumber;
  String? streetName;
  String? area;
  String? mobileNoCountryCode;
  dynamic emergencyHomePhoneCountryCode;
  dynamic emergencyCellPhoneCountryCode;
  dynamic emergencyBusinessPhoneCountryCode;

  factory GenInfo.fromJson(Map<String, dynamic> json) => GenInfo(
        studentId: json["StudentId"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        gender: json["Gender"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        addres: json["Addres"],
        city: json["City"],
        province: json["Province"],
        countryName: json["CountryName"],
        pincode: json["Pincode"],
        mobileNo: json["MobileNo"],
        email: json["Email"],
        maritialStatus: json["MaritialStatus"],
        language: json["Language"],
        citizenshipName: json["CitizenshipName"],
        passportNo: json["PassportNo"],
        agentName: json["AgentName"],
        passportExpiryDate: DateTime.parse(json["PassportExpiryDate"]),
        salution: json["Salution"],
        mailingAddres: json["MailingAddres"],
        mailingCity: json["MailingCity"],
        mailingProvince: json["MailingProvince"],
        mailingCountryName: json["MailingCountryName"],
        mailingPincode: json["MailingPincode"],
        emrgencyName: json["EmrgencyName"],
        emergencyEmail: json["EmergencyEmail"],
        emergencyRelation: json["EmergencyRelation"],
        emergencyHomePhone: json["EmergencyHomePhone"],
        emergencyCellPhone: json["EmergencyCellPhone"],
        emergencyBusinessPhone: json["EmergencyBusinessPhone"],
        emergencyAddress: json["EmergencyAddress"],
        emergencyCity: json["EmergencyCity"],
        emergencyProvince: json["EmergencyProvince"],
        emergencyCountryName: json["EmergencyCountryName"],
        emergencyPincode: json["EmergencyPincode"],
        citizenship: json["Citizenship"],
        agentId: json["AgentId"],
        leadSource: json["LeadSource"],
        leadStatus: json["LeadStatus"],
        houseNumber: json["HouseNumber"],
        streetName: json["StreetName"],
        area: json["Area"],
        mobileNoCountryCode: json["MobileNoCountryCode"],
        emergencyHomePhoneCountryCode: json["EmergencyHomePhoneCountryCode"],
        emergencyCellPhoneCountryCode: json["EmergencyCellPhoneCountryCode"],
        emergencyBusinessPhoneCountryCode:
            json["EmergencyBusinessPhoneCountryCode"],
      );

  Map<String, dynamic> toJson() => {
        "StudentId": studentId,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "Gender": gender,
        "DateOfBirth": dateOfBirth!.toIso8601String(),
        "Addres": addres,
        "City": city,
        "Province": province,
        "CountryName": countryName,
        "Pincode": pincode,
        "MobileNo": mobileNo,
        "Email": email,
        "MaritialStatus": maritialStatus,
        "Language": language,
        "CitizenshipName": citizenshipName,
        "PassportNo": passportNo,
        "AgentName": agentName,
        "PassportExpiryDate": passportExpiryDate!.toIso8601String(),
        "Salution": salution,
        "MailingAddres": mailingAddres,
        "MailingCity": mailingCity,
        "MailingProvince": mailingProvince,
        "MailingCountryName": mailingCountryName,
        "MailingPincode": mailingPincode,
        "EmrgencyName": emrgencyName,
        "EmergencyEmail": emergencyEmail,
        "EmergencyRelation": emergencyRelation,
        "EmergencyHomePhone": emergencyHomePhone,
        "EmergencyCellPhone": emergencyCellPhone,
        "EmergencyBusinessPhone": emergencyBusinessPhone,
        "EmergencyAddress": emergencyAddress,
        "EmergencyCity": emergencyCity,
        "EmergencyProvince": emergencyProvince,
        "EmergencyCountryName": emergencyCountryName,
        "EmergencyPincode": emergencyPincode,
        "Citizenship": citizenship,
        "AgentId": agentId,
        "LeadSource": leadSource,
        "LeadStatus": leadStatus,
        "HouseNumber": houseNumber,
        "StreetName": streetName,
        "Area": area,
        "MobileNoCountryCode": mobileNoCountryCode,
        "EmergencyHomePhoneCountryCode": emergencyHomePhoneCountryCode,
        "EmergencyCellPhoneCountryCode": emergencyCellPhoneCountryCode,
        "EmergencyBusinessPhoneCountryCode": emergencyBusinessPhoneCountryCode,
      };
}

class TestScore {
  TestScore({
    this.englishExamName,
    this.englishExamDate,
    this.englishScoreL,
    this.englishScoreR,
    this.englishScoreW,
    this.englishScoreS,
    this.greExamDate,
    this.greScoreV,
    this.greScoreQ,
    this.greScoreW,
    this.gmatExamDate,
    this.gmatScoreA,
    this.gmatScoreI,
    this.gmatScoreQ,
    this.gmatScoreV,
    this.englishScoreOverall,
    this.englishExamUser,
    this.englishExamPswd,
    this.englishExamRemark,
    this.gmatExamName,
    this.gmatExam,
    this.satScoreTotal,
    this.satScoreMath,
    this.satScoreEbrw,
    this.actScoreTotal,
    this.actScoreEnglish,
    this.actScoreMath,
    this.actScoreReading,
    this.actScoreScience,
    this.actScoreWriting,
    this.englishExamDocPath,
    this.otherExamDocPath,
  });

  dynamic englishExamName;
  String? englishExamDate;
  double? englishScoreL;
  double? englishScoreR;
  double? englishScoreW;
  double? englishScoreS;
  String? greExamDate;
  double? greScoreV;
  double? greScoreQ;
  double? greScoreW;
  String? gmatExamDate;
  double? gmatScoreA;
  double? gmatScoreI;
  double? gmatScoreQ;
  double? gmatScoreV;
  double? englishScoreOverall;
  String? englishExamUser;
  String? englishExamPswd;
  dynamic englishExamRemark;
  String? gmatExamName;
  int? gmatExam;
  double? satScoreTotal;
  double? satScoreMath;
  double? satScoreEbrw;
  double? actScoreTotal;
  double? actScoreEnglish;
  double? actScoreMath;
  double? actScoreReading;
  double? actScoreScience;
  double? actScoreWriting;
  dynamic englishExamDocPath;
  dynamic otherExamDocPath;

  factory TestScore.fromJson(Map<String, dynamic> json) => TestScore(
        englishExamName: json["EnglishExamName"],
        englishExamDate: json["EnglishExamDate"],
        englishScoreL: json["EnglishScoreL"],
        englishScoreR: json["EnglishScoreR"],
        englishScoreW: json["EnglishScoreW"],
        englishScoreS: json["EnglishScoreS"],
        greExamDate: json["GREExamDate"],
        greScoreV: json["GREScoreV"],
        greScoreQ: json["GREScoreQ"],
        greScoreW: json["GREScoreW"],
        gmatExamDate: json["GMATExamDate"],
        gmatScoreA: json["GMATScoreA"],
        gmatScoreI: json["GMATScoreI"],
        gmatScoreQ: json["GMATScoreQ"],
        gmatScoreV: json["GMATScoreV"],
        englishScoreOverall: json["EnglishScoreOverall"],
        englishExamUser: json["EnglishExamUser"],
        englishExamPswd: json["EnglishExamPswd"],
        englishExamRemark: json["EnglishExamRemark"],
        gmatExamName: json["GMATExamName"],
        gmatExam: json["GMATExam"],
        satScoreTotal: json["SATScoreTotal"],
        satScoreMath: json["SATScoreMath"],
        satScoreEbrw: json["SATScoreEBRW"],
        actScoreTotal: json["ACTScoreTotal"],
        actScoreEnglish: json["ACTScoreEnglish"],
        actScoreMath: json["ACTScoreMath"],
        actScoreReading: json["ACTScoreReading"],
        actScoreScience: json["ACTScoreScience"],
        actScoreWriting: json["ACTScoreWriting"],
        englishExamDocPath: json["EnglishExamDocPath"],
        otherExamDocPath: json["OtherExamDocPath"],
      );

  Map<String, dynamic> toJson() => {
        "EnglishExamName": englishExamName,
        "EnglishExamDate": englishExamDate,
        "EnglishScoreL": englishScoreL,
        "EnglishScoreR": englishScoreR,
        "EnglishScoreW": englishScoreW,
        "EnglishScoreS": englishScoreS,
        "GREExamDate": greExamDate,
        "GREScoreV": greScoreV,
        "GREScoreQ": greScoreQ,
        "GREScoreW": greScoreW,
        "GMATExamDate": gmatExamDate,
        "GMATScoreA": gmatScoreA,
        "GMATScoreI": gmatScoreI,
        "GMATScoreQ": gmatScoreQ,
        "GMATScoreV": gmatScoreV,
        "EnglishScoreOverall": englishScoreOverall,
        "EnglishExamUser": englishExamUser,
        "EnglishExamPswd": englishExamPswd,
        "EnglishExamRemark": englishExamRemark,
        "GMATExamName": gmatExamName,
        "GMATExam": gmatExam,
        "SATScoreTotal": satScoreTotal,
        "SATScoreMath": satScoreMath,
        "SATScoreEBRW": satScoreEbrw,
        "ACTScoreTotal": actScoreTotal,
        "ACTScoreEnglish": actScoreEnglish,
        "ACTScoreMath": actScoreMath,
        "ACTScoreReading": actScoreReading,
        "ACTScoreScience": actScoreScience,
        "ACTScoreWriting": actScoreWriting,
        "EnglishExamDocPath": englishExamDocPath,
        "OtherExamDocPath": otherExamDocPath,
      };
}
