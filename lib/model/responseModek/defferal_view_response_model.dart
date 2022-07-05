// To parse this JSON data, do
//
//     final defferalViewResponseModel = defferalViewResponseModelFromJson(jsonString);

import 'dart:convert';

DefferalViewResponseModel defferalViewResponseModelFromJson(String str) =>
    DefferalViewResponseModel.fromJson(json.decode(str));

String defferalViewResponseModelToJson(DefferalViewResponseModel data) =>
    json.encode(data.toJson());

class DefferalViewResponseModel {
  DefferalViewResponseModel({
    this.genInfo,
    this.eduInfo,
    this.testScore,
    this.programInfo,
    this.offerLetterInfo,
    this.deferredInfo,
    this.stageInfo,
    this.abocodoInfo,
    this.applicationpreference,
  });

  GenInfo? genInfo;
  EduInfo? eduInfo;
  TestScore? testScore;
  ProgramInfo? programInfo;
  OfferLetterInfo? offerLetterInfo;
  DeferredInfo? deferredInfo;
  Map<String, int>? stageInfo;
  AbocodoInfo? abocodoInfo;
  List<Applicationpreference>? applicationpreference;

  factory DefferalViewResponseModel.fromJson(Map<String, dynamic> json) =>
      DefferalViewResponseModel(
        genInfo: GenInfo.fromJson(json["genInfo"]),
        eduInfo: EduInfo.fromJson(json["eduInfo"]),
        testScore: TestScore.fromJson(json["testScore"]),
        programInfo: ProgramInfo.fromJson(json["programInfo"]),
        offerLetterInfo: OfferLetterInfo.fromJson(json["offerLetterInfo"]),
        deferredInfo: DeferredInfo.fromJson(json["deferredInfo"]),
        stageInfo: Map.from(json["stageInfo"])
            .map((k, v) => MapEntry<String, int>(k, v == null ? null : v)),
        abocodoInfo: AbocodoInfo.fromJson(json["abocodoInfo"]),
        applicationpreference: List<Applicationpreference>.from(
            json["applicationpreference"]
                .map((x) => Applicationpreference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genInfo": genInfo!.toJson(),
        "eduInfo": eduInfo!.toJson(),
        "testScore": testScore!.toJson(),
        "programInfo": programInfo!.toJson(),
        "offerLetterInfo": offerLetterInfo!.toJson(),
        "deferredInfo": deferredInfo!.toJson(),
        "stageInfo": Map.from(stageInfo!)
            .map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
        "abocodoInfo": abocodoInfo!.toJson(),
        "applicationpreference":
            List<dynamic>.from(applicationpreference!.map((x) => x.toJson())),
      };
}

class AbocodoInfo {
  AbocodoInfo({
    this.abocodoAdmissionExecutive,
    this.abocodoAdmExecName,
    this.abocodoMarketingManager,
    this.abocodoMarketingMgrName,
    this.secondaryAgentId,
    this.secondaryAgentName,
    this.isSubmittedToGmo,
    this.isSubmittedToGmoUser,
    this.submittedToGmoUserName,
  });

  int? abocodoAdmissionExecutive;
  String? abocodoAdmExecName;
  int? abocodoMarketingManager;
  String? abocodoMarketingMgrName;
  int? secondaryAgentId;
  dynamic secondaryAgentName;
  dynamic isSubmittedToGmo;
  int? isSubmittedToGmoUser;
  dynamic submittedToGmoUserName;

  factory AbocodoInfo.fromJson(Map<String, dynamic> json) => AbocodoInfo(
        abocodoAdmissionExecutive: json["AbocodoAdmissionExecutive"],
        abocodoAdmExecName: json["AbocodoAdmExecName"],
        abocodoMarketingManager: json["AbocodoMarketingManager"],
        abocodoMarketingMgrName: json["AbocodoMarketingMgrName"],
        secondaryAgentId: json["SecondaryAgentId"],
        secondaryAgentName: json["SecondaryAgentName"],
        isSubmittedToGmo: json["IsSubmittedToGMO"],
        isSubmittedToGmoUser: json["IsSubmittedToGMOUser"],
        submittedToGmoUserName: json["SubmittedToGMOUserName"],
      );

  Map<String, dynamic> toJson() => {
        "AbocodoAdmissionExecutive": abocodoAdmissionExecutive,
        "AbocodoAdmExecName": abocodoAdmExecName,
        "AbocodoMarketingManager": abocodoMarketingManager,
        "AbocodoMarketingMgrName": abocodoMarketingMgrName,
        "SecondaryAgentId": secondaryAgentId,
        "SecondaryAgentName": secondaryAgentName,
        "IsSubmittedToGMO": isSubmittedToGmo,
        "IsSubmittedToGMOUser": isSubmittedToGmoUser,
        "SubmittedToGMOUserName": submittedToGmoUserName,
      };
}

class Applicationpreference {
  Applicationpreference({
    this.indexId,
    this.programId,
    this.programName,
    this.campusId,
    this.campusName,
    this.modeId,
    this.modeName,
    this.specializationId,
    this.specializationName,
    this.shoreType,
    this.isApplied,
    this.isCurrent,
  });

  int? indexId;
  int? programId;
  String? programName;
  int? campusId;
  dynamic campusName;
  int? modeId;
  String? modeName;
  int? specializationId;
  String? specializationName;
  int? shoreType;
  int? isApplied;
  int? isCurrent;

  factory Applicationpreference.fromJson(Map<String, dynamic> json) =>
      Applicationpreference(
        indexId: json["IndexId"],
        programId: json["ProgramId"],
        programName: json["ProgramName"],
        campusId: json["CampusId"],
        campusName: json["CampusName"],
        modeId: json["ModeId"],
        modeName: json["ModeName"] == null ? null : json["ModeName"],
        specializationId: json["SpecializationId"],
        specializationName: json["SpecializationName"] == null
            ? null
            : json["SpecializationName"],
        shoreType: json["ShoreType"],
        isApplied: json["IsApplied"],
        isCurrent: json["IsCurrent"],
      );

  Map<String, dynamic> toJson() => {
        "IndexId": indexId,
        "ProgramId": programId,
        "ProgramName": programName,
        "CampusId": campusId,
        "CampusName": campusName,
        "ModeId": modeId,
        "ModeName": modeName == null ? null : modeName,
        "SpecializationId": specializationId,
        "SpecializationName":
            specializationName == null ? null : specializationName,
        "ShoreType": shoreType,
        "IsApplied": isApplied,
        "IsCurrent": isCurrent,
      };
}

class DeferredInfo {
  DeferredInfo({
    this.isDeferred,
    this.newIntakeName,
    this.newIntekId,
  });

  dynamic isDeferred;
  dynamic newIntakeName;
  dynamic newIntekId;

  factory DeferredInfo.fromJson(Map<String, dynamic> json) => DeferredInfo(
        isDeferred: json["IsDeferred"],
        newIntakeName: json["NewIntakeName"],
        newIntekId: json["NewIntekId"],
      );

  Map<String, dynamic> toJson() => {
        "IsDeferred": isDeferred,
        "NewIntakeName": newIntakeName,
        "NewIntekId": newIntekId,
      };
}

class EduInfo {
  EduInfo({
    this.applicationId,
    this.countryOfEducation,
    this.highestLevelOfEducation,
    this.gradingScheme,
    this.gradeAverage,
    this.graduatedMostRecent,
    this.eduYearStart,
    this.eduYearEnd,
    this.gradingSchemeName,
    this.highestLevelOfEducationName,
    this.countryOfEducationName,
  });

  int? applicationId;
  dynamic countryOfEducation;
  dynamic highestLevelOfEducation;
  dynamic gradingScheme;
  String? gradeAverage;
  dynamic graduatedMostRecent;
  dynamic eduYearStart;
  dynamic eduYearEnd;
  String? gradingSchemeName;
  String? highestLevelOfEducationName;
  String? countryOfEducationName;

  factory EduInfo.fromJson(Map<String, dynamic> json) => EduInfo(
        applicationId: json["ApplicationId"],
        countryOfEducation: json["CountryOfEducation"],
        highestLevelOfEducation: json["HighestLevelOfEducation"],
        gradingScheme: json["GradingScheme"],
        gradeAverage: json["GradeAverage"],
        graduatedMostRecent: json["GraduatedMostRecent"],
        eduYearStart: json["EduYearStart"],
        eduYearEnd: json["EduYearEnd"],
        gradingSchemeName: json["GradingSchemeName"],
        highestLevelOfEducationName: json["HighestLevelOfEducationName"],
        countryOfEducationName: json["CountryOfEducationName"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "CountryOfEducation": countryOfEducation,
        "HighestLevelOfEducation": highestLevelOfEducation,
        "GradingScheme": gradingScheme,
        "GradeAverage": gradeAverage,
        "GraduatedMostRecent": graduatedMostRecent,
        "EduYearStart": eduYearStart,
        "EduYearEnd": eduYearEnd,
        "GradingSchemeName": gradingSchemeName,
        "HighestLevelOfEducationName": highestLevelOfEducationName,
        "CountryOfEducationName": countryOfEducationName,
      };
}

class GenInfo {
  GenInfo({
    this.applicationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.addres,
    this.city,
    this.province,
    this.country,
    this.pincode,
    this.mobileNo,
    this.email,
    this.maritialStatus,
    this.language,
    this.citizenship,
    this.passportNo,
    this.enrollmentNo,
    this.studentId,
    this.assignedTo,
    this.agentId,
    this.passportExpiryDate,
    this.marketingManager,
    this.admissionExecutive,
    this.salution,
    this.instUserId,
    this.mailingAddres,
    this.mailingCity,
    this.mailingProvince,
    this.mailingCountry,
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
    this.emergencyCountry,
    this.emergencyPincode,
    this.appPassword,
    this.mailingAddressSame,
    this.emergencyAddressSame,
    this.shoreType,
    this.mobileNoCountryCode,
    this.emergencyHomePhoneCountryCode,
    this.emergencyCellPhoneCountryCode,
    this.emergencyBusinessPhoneCountryCode,
    this.appCounsellorName,
    this.appCounsellorEmail,
    this.appCounsellorPhoneNo,
    this.countryName,
    this.citizenshipName,
    this.assignedToName,
    this.agentName,
    this.marketingManagerName,
    this.admissionExecutiveName,
    this.mailingCountryName,
    this.emergencyCountryName,
    this.countryShortName,
    this.counsellorCity,
    this.counsellorCountry,
    this.counsellorEmailId,
    this.houseNumber,
    this.streetName,
    this.area,
    this.marketingManagerEmailId,
    this.abocodoMarketingMgrEmailId,
  });

  int? applicationId;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? gender;
  DateTime? dateOfBirth;
  String? addres;
  String? city;
  String? province;
  dynamic country;
  String? pincode;
  String? mobileNo;
  String? email;
  String? maritialStatus;
  String? language;
  int? citizenship;
  String? passportNo;
  String? enrollmentNo;
  int? studentId;
  int? assignedTo;
  int? agentId;
  DateTime? passportExpiryDate;
  int? marketingManager;
  int? admissionExecutive;
  String? salution;
  dynamic instUserId;
  String? mailingAddres;
  String? mailingCity;
  String? mailingProvince;
  dynamic mailingCountry;
  String? mailingPincode;
  String? emrgencyName;
  String? emergencyEmail;
  String? emergencyRelation;
  String? emergencyHomePhone;
  String? emergencyCellPhone;
  String? emergencyBusinessPhone;
  String? emergencyAddress;
  String? emergencyCity;
  dynamic emergencyProvince;
  dynamic emergencyCountry;
  String? emergencyPincode;
  dynamic appPassword;
  dynamic mailingAddressSame;
  dynamic emergencyAddressSame;
  dynamic shoreType;
  String? mobileNoCountryCode;
  dynamic emergencyHomePhoneCountryCode;
  dynamic emergencyCellPhoneCountryCode;
  dynamic emergencyBusinessPhoneCountryCode;
  dynamic appCounsellorName;
  dynamic appCounsellorEmail;
  dynamic appCounsellorPhoneNo;
  String? countryName;
  String? citizenshipName;
  String? assignedToName;
  String? agentName;
  String? marketingManagerName;
  String? admissionExecutiveName;
  String? mailingCountryName;
  dynamic emergencyCountryName;
  String? countryShortName;
  String? counsellorCity;
  String? counsellorCountry;
  String? counsellorEmailId;
  dynamic houseNumber;
  dynamic streetName;
  dynamic area;
  dynamic marketingManagerEmailId;
  dynamic abocodoMarketingMgrEmailId;

  factory GenInfo.fromJson(Map<String, dynamic> json) => GenInfo(
        applicationId: json["ApplicationId"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        gender: json["Gender"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        addres: json["Addres"],
        city: json["City"],
        province: json["Province"],
        country: json["Country"],
        pincode: json["Pincode"],
        mobileNo: json["MobileNo"],
        email: json["Email"],
        maritialStatus: json["MaritialStatus"],
        language: json["Language"],
        citizenship: json["Citizenship"],
        passportNo: json["PassportNo"],
        enrollmentNo: json["EnrollmentNo"],
        studentId: json["StudentId"],
        assignedTo: json["AssignedTo"],
        agentId: json["AgentId"],
        passportExpiryDate: DateTime.parse(json["PassportExpiryDate"]),
        marketingManager: json["MarketingManager"],
        admissionExecutive: json["AdmissionExecutive"],
        salution: json["Salution"],
        instUserId: json["InstUserID"],
        mailingAddres: json["MailingAddres"],
        mailingCity: json["MailingCity"],
        mailingProvince: json["MailingProvince"],
        mailingCountry: json["MailingCountry"],
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
        emergencyCountry: json["EmergencyCountry"],
        emergencyPincode: json["EmergencyPincode"],
        appPassword: json["App_Password"],
        mailingAddressSame: json["MailingAddressSame"],
        emergencyAddressSame: json["EmergencyAddressSame"],
        shoreType: json["ShoreType"],
        mobileNoCountryCode: json["MobileNoCountryCode"],
        emergencyHomePhoneCountryCode: json["EmergencyHomePhoneCountryCode"],
        emergencyCellPhoneCountryCode: json["EmergencyCellPhoneCountryCode"],
        emergencyBusinessPhoneCountryCode:
            json["EmergencyBusinessPhoneCountryCode"],
        appCounsellorName: json["AppCounsellorName"],
        appCounsellorEmail: json["AppCounsellorEmail"],
        appCounsellorPhoneNo: json["AppCounsellorPhoneNo"],
        countryName: json["CountryName"],
        citizenshipName: json["CitizenshipName"],
        assignedToName: json["AssignedToName"],
        agentName: json["AgentName"],
        marketingManagerName: json["MarketingManagerName"],
        admissionExecutiveName: json["AdmissionExecutiveName"],
        mailingCountryName: json["MailingCountryName"],
        emergencyCountryName: json["EmergencyCountryName"],
        countryShortName: json["CountryShortName"],
        counsellorCity: json["CounsellorCity"],
        counsellorCountry: json["CounsellorCountry"],
        counsellorEmailId: json["CounsellorEmailId"],
        houseNumber: json["HouseNumber"],
        streetName: json["StreetName"],
        area: json["Area"],
        marketingManagerEmailId: json["MarketingManagerEmailId"],
        abocodoMarketingMgrEmailId: json["abocodoMarketingMgrEmailId"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "Gender": gender,
        "DateOfBirth": dateOfBirth!.toIso8601String(),
        "Addres": addres,
        "City": city,
        "Province": province,
        "Country": country,
        "Pincode": pincode,
        "MobileNo": mobileNo,
        "Email": email,
        "MaritialStatus": maritialStatus,
        "Language": language,
        "Citizenship": citizenship,
        "PassportNo": passportNo,
        "EnrollmentNo": enrollmentNo,
        "StudentId": studentId,
        "AssignedTo": assignedTo,
        "AgentId": agentId,
        "PassportExpiryDate": passportExpiryDate!.toIso8601String(),
        "MarketingManager": marketingManager,
        "AdmissionExecutive": admissionExecutive,
        "Salution": salution,
        "InstUserID": instUserId,
        "MailingAddres": mailingAddres,
        "MailingCity": mailingCity,
        "MailingProvince": mailingProvince,
        "MailingCountry": mailingCountry,
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
        "EmergencyCountry": emergencyCountry,
        "EmergencyPincode": emergencyPincode,
        "App_Password": appPassword,
        "MailingAddressSame": mailingAddressSame,
        "EmergencyAddressSame": emergencyAddressSame,
        "ShoreType": shoreType,
        "MobileNoCountryCode": mobileNoCountryCode,
        "EmergencyHomePhoneCountryCode": emergencyHomePhoneCountryCode,
        "EmergencyCellPhoneCountryCode": emergencyCellPhoneCountryCode,
        "EmergencyBusinessPhoneCountryCode": emergencyBusinessPhoneCountryCode,
        "AppCounsellorName": appCounsellorName,
        "AppCounsellorEmail": appCounsellorEmail,
        "AppCounsellorPhoneNo": appCounsellorPhoneNo,
        "CountryName": countryName,
        "CitizenshipName": citizenshipName,
        "AssignedToName": assignedToName,
        "AgentName": agentName,
        "MarketingManagerName": marketingManagerName,
        "AdmissionExecutiveName": admissionExecutiveName,
        "MailingCountryName": mailingCountryName,
        "EmergencyCountryName": emergencyCountryName,
        "CountryShortName": countryShortName,
        "CounsellorCity": counsellorCity,
        "CounsellorCountry": counsellorCountry,
        "CounsellorEmailId": counsellorEmailId,
        "HouseNumber": houseNumber,
        "StreetName": streetName,
        "Area": area,
        "MarketingManagerEmailId": marketingManagerEmailId,
        "abocodoMarketingMgrEmailId": abocodoMarketingMgrEmailId,
      };
}

class OfferLetterInfo {
  OfferLetterInfo({
    this.applicationId,
    this.offerLetterPath,
    this.offerLetterUser,
  });

  int? applicationId;
  dynamic offerLetterPath;
  dynamic offerLetterUser;

  factory OfferLetterInfo.fromJson(Map<String, dynamic> json) =>
      OfferLetterInfo(
        applicationId: json["ApplicationId"],
        offerLetterPath: json["OfferLetterPath"],
        offerLetterUser: json["OfferLetterUser"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "OfferLetterPath": offerLetterPath,
        "OfferLetterUser": offerLetterUser,
      };
}

class ProgramInfo {
  ProgramInfo({
    this.applicationId,
    this.applicationStatus,
    this.applicationStatusName,
    this.programId,
    this.intekId,
    this.institutionId,
    this.isSubmited,
    this.isSubmitedToInstitute,
    this.termsAccepted,
    this.campus,
    this.applicationMode,
    this.citizenship,
    this.specializationId,
    this.shoreType,
    this.instCountry,
    this.partnerTypeId,
    this.instName,
    this.programName,
    this.intakeName,
    this.campusName,
    this.modeName,
    this.instCurrency,
    this.submissionDeadLine,
    this.durationTime,
    this.durationType,
    this.averageProcessingDay,
    this.instCostofLivingYear,
    this.isCreditCardRequired,
    this.reviewStatus,
    this.conditionalApplication,
    this.specializationName,
    this.onshoreSubmissionDeadline,
    this.partnerTypeName,
    this.b1ProgramId,
    this.b2ProgramId,
    this.b3ProgramId,
    this.b1ProgramName,
    this.b2ProgramName,
    this.b3ProgramName,
    this.b1DurationTime,
    this.b2DurationTime,
    this.b3DurationTime,
    this.b1TuitionFee,
    this.b2TuitionFee,
    this.b3TuitionFee,
    this.primaryProgramId,
    this.primaryProgramName,
    this.primaryDurationTime,
    this.primaryTuitionFee,
  });

  int? applicationId;
  int? applicationStatus;
  String? applicationStatusName;
  int? programId;
  int? intekId;
  int? institutionId;
  int? isSubmited;
  int? isSubmitedToInstitute;
  int? termsAccepted;
  dynamic campus;
  dynamic applicationMode;
  dynamic citizenship;
  int? specializationId;
  int? shoreType;
  int? instCountry;
  int? partnerTypeId;
  String? instName;
  String? programName;
  String? intakeName;
  dynamic campusName;
  String? modeName;
  String? instCurrency;
  DateTime? submissionDeadLine;
  String? durationTime;
  int? durationType;
  String? averageProcessingDay;
  String? instCostofLivingYear;
  bool? isCreditCardRequired;
  int? reviewStatus;
  int? conditionalApplication;
  String? specializationName;
  DateTime? onshoreSubmissionDeadline;
  String? partnerTypeName;
  dynamic b1ProgramId;
  dynamic b2ProgramId;
  dynamic b3ProgramId;
  dynamic b1ProgramName;
  dynamic b2ProgramName;
  dynamic b3ProgramName;
  dynamic b1DurationTime;
  dynamic b2DurationTime;
  dynamic b3DurationTime;
  int? b1TuitionFee;
  int? b2TuitionFee;
  int? b3TuitionFee;
  int? primaryProgramId;
  dynamic primaryProgramName;
  dynamic primaryDurationTime;
  int? primaryTuitionFee;

  factory ProgramInfo.fromJson(Map<String, dynamic> json) => ProgramInfo(
        applicationId: json["ApplicationId"],
        applicationStatus: json["ApplicationStatus"],
        applicationStatusName: json["ApplicationStatusName"],
        programId: json["ProgramId"],
        intekId: json["IntekId"],
        institutionId: json["InstitutionId"],
        isSubmited: json["isSubmited"],
        isSubmitedToInstitute: json["isSubmitedToInstitute"],
        termsAccepted: json["termsAccepted"],
        campus: json["Campus"],
        applicationMode: json["ApplicationMode"],
        citizenship: json["Citizenship"],
        specializationId: json["SpecializationId"],
        shoreType: json["ShoreType"],
        instCountry: json["InstCountry"],
        partnerTypeId: json["PartnerTypeId"],
        instName: json["InstName"],
        programName: json["ProgramName"],
        intakeName: json["IntakeName"],
        campusName: json["CampusName"],
        modeName: json["ModeName"],
        instCurrency: json["InstCurrency"],
        submissionDeadLine: DateTime.parse(json["SubmissionDeadLine"]),
        durationTime: json["DurationTime"],
        durationType: json["DurationType"],
        averageProcessingDay: json["AverageProcessingDay"],
        instCostofLivingYear: json["InstCostofLiving_Year"],
        isCreditCardRequired: json["isCreditCardRequired"],
        reviewStatus: json["ReviewStatus"],
        conditionalApplication: json["ConditionalApplication"],
        specializationName: json["SpecializationName"],
        onshoreSubmissionDeadline:
            DateTime.parse(json["OnshoreSubmissionDeadline"]),
        partnerTypeName: json["PartnerTypeName"],
        b1ProgramId: json["B1ProgramId"],
        b2ProgramId: json["B2ProgramId"],
        b3ProgramId: json["B3ProgramId"],
        b1ProgramName: json["B1ProgramName"],
        b2ProgramName: json["B2ProgramName"],
        b3ProgramName: json["B3ProgramName"],
        b1DurationTime: json["B1DurationTime"],
        b2DurationTime: json["B2DurationTime"],
        b3DurationTime: json["B3DurationTime"],
        b1TuitionFee: json["B1TuitionFee"],
        b2TuitionFee: json["B2TuitionFee"],
        b3TuitionFee: json["B3TuitionFee"],
        primaryProgramId: json["PrimaryProgramId"],
        primaryProgramName: json["PrimaryProgramName"],
        primaryDurationTime: json["PrimaryDurationTime"],
        primaryTuitionFee: json["PrimaryTuitionFee"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicationId": applicationId,
        "ApplicationStatus": applicationStatus,
        "ApplicationStatusName": applicationStatusName,
        "ProgramId": programId,
        "IntekId": intekId,
        "InstitutionId": institutionId,
        "isSubmited": isSubmited,
        "isSubmitedToInstitute": isSubmitedToInstitute,
        "termsAccepted": termsAccepted,
        "Campus": campus,
        "ApplicationMode": applicationMode,
        "Citizenship": citizenship,
        "SpecializationId": specializationId,
        "ShoreType": shoreType,
        "InstCountry": instCountry,
        "PartnerTypeId": partnerTypeId,
        "InstName": instName,
        "ProgramName": programName,
        "IntakeName": intakeName,
        "CampusName": campusName,
        "ModeName": modeName,
        "InstCurrency": instCurrency,
        "SubmissionDeadLine": submissionDeadLine!.toIso8601String(),
        "DurationTime": durationTime,
        "DurationType": durationType,
        "AverageProcessingDay": averageProcessingDay,
        "InstCostofLiving_Year": instCostofLivingYear,
        "isCreditCardRequired": isCreditCardRequired,
        "ReviewStatus": reviewStatus,
        "ConditionalApplication": conditionalApplication,
        "SpecializationName": specializationName,
        "OnshoreSubmissionDeadline":
            onshoreSubmissionDeadline!.toIso8601String(),
        "PartnerTypeName": partnerTypeName,
        "B1ProgramId": b1ProgramId,
        "B2ProgramId": b2ProgramId,
        "B3ProgramId": b3ProgramId,
        "B1ProgramName": b1ProgramName,
        "B2ProgramName": b2ProgramName,
        "B3ProgramName": b3ProgramName,
        "B1DurationTime": b1DurationTime,
        "B2DurationTime": b2DurationTime,
        "B3DurationTime": b3DurationTime,
        "B1TuitionFee": b1TuitionFee,
        "B2TuitionFee": b2TuitionFee,
        "B3TuitionFee": b3TuitionFee,
        "PrimaryProgramId": primaryProgramId,
        "PrimaryProgramName": primaryProgramName,
        "PrimaryDurationTime": primaryDurationTime,
        "PrimaryTuitionFee": primaryTuitionFee,
      };
}

class TestScore {
  TestScore({
    this.applicationId,
    this.englishExamName,
    this.englishExamType,
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
    this.greExam,
    this.gmatExam,
    this.gmatExamName,
    this.englishScoreOverall,
    this.englishExamUser,
    this.englishExamPswd,
    this.englishExamRemark,
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

  int? applicationId;
  dynamic englishExamName;
  dynamic englishExamType;
  String? englishExamDate;
  int? englishScoreL;
  int? englishScoreR;
  int? englishScoreW;
  int? englishScoreS;
  String? greExamDate;
  int? greScoreV;
  int? greScoreQ;
  int? greScoreW;
  String? gmatExamDate;
  int? gmatScoreA;
  int? gmatScoreI;
  int? gmatScoreQ;
  int? gmatScoreV;
  dynamic greExam;
  int? gmatExam;
  String? gmatExamName;
  int? englishScoreOverall;
  String? englishExamUser;
  String? englishExamPswd;
  String? englishExamRemark;
  int? satScoreTotal;
  int? satScoreMath;
  int? satScoreEbrw;
  int? actScoreTotal;
  int? actScoreEnglish;
  int? actScoreMath;
  int? actScoreReading;
  int? actScoreScience;
  int? actScoreWriting;
  String? englishExamDocPath;
  String? otherExamDocPath;

  factory TestScore.fromJson(Map<String, dynamic> json) => TestScore(
        applicationId: json["ApplicationId"],
        englishExamName: json["EnglishExamName"],
        englishExamType: json["EnglishExamType"],
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
        greExam: json["GREExam"],
        gmatExam: json["GMATExam"],
        gmatExamName: json["GMATExamName"],
        englishScoreOverall: json["EnglishScoreOverall"],
        englishExamUser: json["EnglishExamUser"],
        englishExamPswd: json["EnglishExamPswd"],
        englishExamRemark: json["EnglishExamRemark"],
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
        "ApplicationId": applicationId,
        "EnglishExamName": englishExamName,
        "EnglishExamType": englishExamType,
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
        "GREExam": greExam,
        "GMATExam": gmatExam,
        "GMATExamName": gmatExamName,
        "EnglishScoreOverall": englishScoreOverall,
        "EnglishExamUser": englishExamUser,
        "EnglishExamPswd": englishExamPswd,
        "EnglishExamRemark": englishExamRemark,
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
