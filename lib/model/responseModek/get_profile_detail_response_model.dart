// To parse this JSON data, do
//
//     final profileDetailResponseModel = profileDetailResponseModelFromJson(jsonString);

import 'dart:convert';

ProfileDetailResponseModel profileDetailResponseModelFromJson(String str) => ProfileDetailResponseModel.fromJson(json.decode(str));

String profileDetailResponseModelToJson(ProfileDetailResponseModel data) => json.encode(data.toJson());

class ProfileDetailResponseModel {
  ProfileDetailResponseModel({
    this.countryOfBusiness,
    this.streetAddress,
    this.bankName,
    this.bankAddress,
    this.institutionNo,
    this.transitNo,
    this.accountNo,
    this.accountName,
    this.comment,
    this.zipcode,
    this.ifscCode,
    this.swiftCode,
    this.primContName,
    this.primContSkypeId,
    this.primContWhatsappId,
    this.primContEmail,
    this.primContPhoneNo,
    this.primContMobileNo,
    this.primContStreetAddress,
    this.primContCity,
    this.primContProvince,
    this.primCoutCountry,
    this.primContZipcode,
    this.secondContName,
    this.secondContSkypeId,
    this.secondContWhatsappId,
    this.secondContEmail,
    this.secondContPhoneNo,
    this.secondContMobileNo,
    this.secondContStreetAddress,
    this.secondContCity,
    this.secondContProvince,
    this.secondCoutCountry,
    this.secondContZipcode,
    this.directorContName,
    this.directorContSkypeId,
    this.directorContWhatsappId,
    this.directorContEmail,
    this.directorContPhoneNo,
    this.directorContMobileNo,
    this.directorContStreetAddress,
    this.directorContCity,
    this.directorContProvince,
    this.directorCoutCountry,
    this.directorContZipcode,
    this.branchName,
    this.branchNo,
    this.panNo,
    this.currency,
    this.partnerTypeId,
    this.document,
    this.refList,
    this.agentId,
    this.companyName,
    this.website,
    this.skypeId,
    this.whatsappId,
    this.legalFirstName,
    this.legalLastName,
    this.email,
    this.phoneNo,
    this.phoneNo1,
    this.agentStatus,
    this.city,
    this.province,
    this.country,
    this.addStamp,
    this.companyLegalName,
    this.abcodoReportTo,
    this.reportingManager,
    this.partnerTypeName,
  });

  List<int>? countryOfBusiness;
  String? streetAddress;
  String? bankName;
  String? bankAddress;
  String? institutionNo;
  String? transitNo;
  String? accountNo;
  String? accountName;
  String? comment;
  String? zipcode;
  String? ifscCode;
  String? swiftCode;
  String? primContName;
  dynamic primContSkypeId;
  dynamic primContWhatsappId;
  String? primContEmail;
  dynamic primContPhoneNo;
  dynamic primContMobileNo;
  dynamic primContStreetAddress;
  dynamic primContCity;
  int? primContProvince;
  dynamic primCoutCountry;
  dynamic primContZipcode;
  dynamic secondContName;
  dynamic secondContSkypeId;
  dynamic secondContWhatsappId;
  dynamic secondContEmail;
  dynamic secondContPhoneNo;
  dynamic secondContMobileNo;
  dynamic secondContStreetAddress;
  dynamic secondContCity;
  dynamic secondContProvince;
  dynamic secondCoutCountry;
  dynamic secondContZipcode;
  dynamic directorContName;
  dynamic directorContSkypeId;
  dynamic directorContWhatsappId;
  String? directorContEmail;
  String? directorContPhoneNo;
  dynamic directorContMobileNo;
  dynamic directorContStreetAddress;
  dynamic directorContCity;
  int? directorContProvince;
  dynamic directorCoutCountry;
  dynamic directorContZipcode;
  String? branchName;
  String? branchNo;
  dynamic panNo;
  dynamic currency;
  int? partnerTypeId;
  dynamic document;
  dynamic refList;
  int? agentId;
  String? companyName;
  String? website;
  String? skypeId;
  String? whatsappId;
  String? legalFirstName;
  String? legalLastName;
  String? email;
  String? phoneNo;
  String? phoneNo1;
  int? agentStatus;
  String? city;
  int? province;
  int? country;
  dynamic addStamp;
  String? companyLegalName;
  dynamic abcodoReportTo;
  dynamic reportingManager;
  dynamic partnerTypeName;

  factory ProfileDetailResponseModel.fromJson(Map<String, dynamic> json) => ProfileDetailResponseModel(
    countryOfBusiness: List<int>.from(json["CountryOfBusiness"].map((x) => x)),
    streetAddress: json["StreetAddress"],
    bankName: json["BankName"],
    bankAddress: json["BankAddress"],
    institutionNo: json["InstitutionNo"],
    transitNo: json["TransitNo"],
    accountNo: json["AccountNo"],
    accountName: json["AccountName"],
    comment: json["Comment"],
    zipcode: json["Zipcode"],
    ifscCode: json["IFSCCode"],
    swiftCode: json["SwiftCode"],
    primContName: json["PrimContName"],
    primContSkypeId: json["PrimContSkypeId"],
    primContWhatsappId: json["PrimContWhatsappId"],
    primContEmail: json["PrimContEmail"],
    primContPhoneNo: json["PrimContPhoneNo"],
    primContMobileNo: json["PrimContMobileNo"],
    primContStreetAddress: json["PrimContStreetAddress"],
    primContCity: json["PrimContCity"],
    primContProvince: json["PrimContProvince"],
    primCoutCountry: json["PrimCoutCountry"],
    primContZipcode: json["PrimContZipcode"],
    secondContName: json["SecondContName"],
    secondContSkypeId: json["SecondContSkypeId"],
    secondContWhatsappId: json["SecondContWhatsappId"],
    secondContEmail: json["SecondContEmail"],
    secondContPhoneNo: json["SecondContPhoneNo"],
    secondContMobileNo: json["SecondContMobileNo"],
    secondContStreetAddress: json["SecondContStreetAddress"],
    secondContCity: json["SecondContCity"],
    secondContProvince: json["SecondContProvince"],
    secondCoutCountry: json["SecondCoutCountry"],
    secondContZipcode: json["SecondContZipcode"],
    directorContName: json["DirectorContName"],
    directorContSkypeId: json["DirectorContSkypeId"],
    directorContWhatsappId: json["DirectorContWhatsappId"],
    directorContEmail: json["DirectorContEmail"],
    directorContPhoneNo: json["DirectorContPhoneNo"],
    directorContMobileNo: json["DirectorContMobileNo"],
    directorContStreetAddress: json["DirectorContStreetAddress"],
    directorContCity: json["DirectorContCity"],
    directorContProvince: json["DirectorContProvince"],
    directorCoutCountry: json["DirectorCoutCountry"],
    directorContZipcode: json["DirectorContZipcode"],
    branchName: json["BranchName"],
    branchNo: json["BranchNo"],
    panNo: json["PanNo"],
    currency: json["currency"],
    partnerTypeId: json["PartnerTypeId"],
    document: json["Document"],
    refList: json["RefList"],
    agentId: json["AgentId"],
    companyName: json["CompanyName"],
    website: json["Website"],
    skypeId: json["SkypeId"],
    whatsappId: json["WhatsappId"],
    legalFirstName: json["LegalFirstName"],
    legalLastName: json["LegalLastName"],
    email: json["Email"],
    phoneNo: json["PhoneNo"],
    phoneNo1: json["PhoneNo1"],
    agentStatus: json["AgentStatus"],
    city: json["City"],
    province: json["Province"],
    country: json["Country"],
    addStamp: json["AddStamp"],
    companyLegalName: json["CompanyLegalName"],
    abcodoReportTo: json["AbcodoReportTo"],
    reportingManager: json["ReportingManager"],
    partnerTypeName: json["PartnerTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "CountryOfBusiness": List<dynamic>.from(countryOfBusiness!.map((x) => x)),
    "StreetAddress": streetAddress,
    "BankName": bankName,
    "BankAddress": bankAddress,
    "InstitutionNo": institutionNo,
    "TransitNo": transitNo,
    "AccountNo": accountNo,
    "AccountName": accountName,
    "Comment": comment,
    "Zipcode": zipcode,
    "IFSCCode": ifscCode,
    "SwiftCode": swiftCode,
    "PrimContName": primContName,
    "PrimContSkypeId": primContSkypeId,
    "PrimContWhatsappId": primContWhatsappId,
    "PrimContEmail": primContEmail,
    "PrimContPhoneNo": primContPhoneNo,
    "PrimContMobileNo": primContMobileNo,
    "PrimContStreetAddress": primContStreetAddress,
    "PrimContCity": primContCity,
    "PrimContProvince": primContProvince,
    "PrimCoutCountry": primCoutCountry,
    "PrimContZipcode": primContZipcode,
    "SecondContName": secondContName,
    "SecondContSkypeId": secondContSkypeId,
    "SecondContWhatsappId": secondContWhatsappId,
    "SecondContEmail": secondContEmail,
    "SecondContPhoneNo": secondContPhoneNo,
    "SecondContMobileNo": secondContMobileNo,
    "SecondContStreetAddress": secondContStreetAddress,
    "SecondContCity": secondContCity,
    "SecondContProvince": secondContProvince,
    "SecondCoutCountry": secondCoutCountry,
    "SecondContZipcode": secondContZipcode,
    "DirectorContName": directorContName,
    "DirectorContSkypeId": directorContSkypeId,
    "DirectorContWhatsappId": directorContWhatsappId,
    "DirectorContEmail": directorContEmail,
    "DirectorContPhoneNo": directorContPhoneNo,
    "DirectorContMobileNo": directorContMobileNo,
    "DirectorContStreetAddress": directorContStreetAddress,
    "DirectorContCity": directorContCity,
    "DirectorContProvince": directorContProvince,
    "DirectorCoutCountry": directorCoutCountry,
    "DirectorContZipcode": directorContZipcode,
    "BranchName": branchName,
    "BranchNo": branchNo,
    "PanNo": panNo,
    "currency": currency,
    "PartnerTypeId": partnerTypeId,
    "Document": document,
    "RefList": refList,
    "AgentId": agentId,
    "CompanyName": companyName,
    "Website": website,
    "SkypeId": skypeId,
    "WhatsappId": whatsappId,
    "LegalFirstName": legalFirstName,
    "LegalLastName": legalLastName,
    "Email": email,
    "PhoneNo": phoneNo,
    "PhoneNo1": phoneNo1,
    "AgentStatus": agentStatus,
    "City": city,
    "Province": province,
    "Country": country,
    "AddStamp": addStamp,
    "CompanyLegalName": companyLegalName,
    "AbcodoReportTo": abcodoReportTo,
    "ReportingManager": reportingManager,
    "PartnerTypeName": partnerTypeName,
  };
}
