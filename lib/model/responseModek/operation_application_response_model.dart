// To parse this JSON data, do
//
//     final applicationResponseModel = applicationResponseModelFromJson(jsonString);

import 'dart:convert';

ApplicationResponseModel applicationResponseModelFromJson(String str) =>
    ApplicationResponseModel.fromJson(json.decode(str));

String applicationResponseModelToJson(ApplicationResponseModel data) =>
    json.encode(data.toJson());

class ApplicationResponseModel {
  ApplicationResponseModel({
    this.data,
  });

  List<Datum>? data;

  factory ApplicationResponseModel.fromJson(Map<String, dynamic> json) =>
      ApplicationResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.applicationId,
    this.msmid,
    this.studentId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.applicationDate,
    this.city,
    this.province,
    this.citizenship,
    this.submitDate,
    this.assignedTo,
    this.agentName,
    this.dateOfBirth,
    this.email,
    this.mobileNo,
    this.programId,
    this.programName,
    this.intakeName,
    this.intekId,
    this.contactNumber,
    this.instName,
    this.enrollmentNo,
    this.statusName,
    this.reviewStatus,
    this.isSubmited,
    this.addUser,
    this.loggedByRole,
    this.refundApplied,
    this.tuitionFee,
    this.refundStatus,
    this.partnerTypeId,
    this.partnerTypeName,
    this.admissionExecutive,
    this.marketingManager,
    this.noofDays,
    this.agentProvince,
    this.agentCountry,
    this.agentPartnerTypeName,
    this.instCountryName,
    this.logTimeStamp,
    this.institutionId,
    this.instname,
    this.applcaitionFeeStatus,
    this.documentsStatus,
  });

  int? applicationId;
  dynamic msmid;
  int? studentId;
  String? firstName;
  String? middleName;
  String? lastName;
  DateTime? applicationDate;
  String? city;
  String? province;
  String? citizenship;
  dynamic submitDate;
  String? assignedTo;
  String? agentName;
  DateTime? dateOfBirth;
  String? email;
  String? mobileNo;
  dynamic programId;
  String? programName;
  String? intakeName;
  dynamic intekId;
  dynamic contactNumber;
  String? instName;
  dynamic enrollmentNo;
  String? statusName;
  String? reviewStatus;
  int? isSubmited;
  String? addUser;
  String? loggedByRole;
  int? refundApplied;
  bool? tuitionFee;
  int? refundStatus;
  int? partnerTypeId;
  String? partnerTypeName;
  String? admissionExecutive;
  String? marketingManager;
  int? noofDays;
  String? agentProvince;
  String? agentCountry;
  String? agentPartnerTypeName;
  String? instCountryName;
  String? logTimeStamp;
  dynamic institutionId;
  dynamic instname;
  dynamic applcaitionFeeStatus;
  dynamic documentsStatus;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        applicationId: json["ApplicationId"],
        msmid: json["MSMID"],
        studentId: json["StudentId"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        applicationDate: DateTime.parse(json["ApplicationDate"]),
        city: json["City"],
        province: json["Province"],
        citizenship: json["Citizenship"],
        submitDate: json["SubmitDate"],
        assignedTo: json["AssignedTo"],
        agentName: json["AgentName"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        email: json["Email"],
        mobileNo: json["MobileNo"],
        programId: json["ProgramId"],
        programName: json["ProgramName"],
        intakeName: json["IntakeName"],
        intekId: json["IntekId"],
        contactNumber: json["ContactNumber"],
        instName: json["InstName"],
        enrollmentNo: json["EnrollmentNo"],
        statusName: json["StatusName"],
        reviewStatus: json["ReviewStatus"],
        isSubmited: json["isSubmited"],
        addUser: json["AddUser"],
        loggedByRole: json["LoggedByRole"],
        refundApplied: json["RefundApplied"],
        tuitionFee: json["TuitionFee"],
        refundStatus: json["RefundStatus"],
        partnerTypeId: json["PartnerTypeId"],
        partnerTypeName: json["PartnerTypeName"],
        admissionExecutive: json["AdmissionExecutive"],
        marketingManager: json["MarketingManager"],
        noofDays: json["NoofDays"],
        agentProvince: json["AgentProvince"],
        agentCountry: json["AgentCountry"],
        agentPartnerTypeName: json["AgentPartnerTypeName"],
        instCountryName: json["InstCountryName"],
        logTimeStamp: json["LogTimeStamp"],
        institutionId: json["InstitutionId"],
        instname: json["Instname"],
        applcaitionFeeStatus: json["ApplcaitionFeeStatus"],
        documentsStatus: json["DocumentsStatus"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "MSMID": msmid,
        "StudentId": studentId,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "ApplicationDate": applicationDate!.toIso8601String(),
        "City": city,
        "Province": province,
        "Citizenship": citizenship,
        "SubmitDate": submitDate,
        "AssignedTo": assignedTo,
        "AgentName": agentName,
        "DateOfBirth": dateOfBirth!.toIso8601String(),
        "Email": email,
        "MobileNo": mobileNo,
        "ProgramId": programId,
        "ProgramName": programName,
        "IntakeName": intakeName,
        "IntekId": intekId,
        "ContactNumber": contactNumber,
        "InstName": instName,
        "EnrollmentNo": enrollmentNo,
        "StatusName": statusName,
        "ReviewStatus": reviewStatus,
        "isSubmited": isSubmited,
        "AddUser": addUser,
        "LoggedByRole": loggedByRole,
        "RefundApplied": refundApplied,
        "TuitionFee": tuitionFee,
        "RefundStatus": refundStatus,
        "PartnerTypeId": partnerTypeId,
        "PartnerTypeName": partnerTypeName,
        "AdmissionExecutive": admissionExecutive,
        "MarketingManager": marketingManager,
        "NoofDays": noofDays,
        "AgentProvince": agentProvince,
        "AgentCountry": agentCountry,
        "AgentPartnerTypeName": agentPartnerTypeName,
        "InstCountryName": instCountryName,
        "LogTimeStamp": logTimeStamp,
        "InstitutionId": institutionId,
        "Instname": instname,
        "ApplcaitionFeeStatus": applcaitionFeeStatus,
        "DocumentsStatus": documentsStatus,
      };
}
