// To parse this JSON data, do
//
//     final updateProgramResponseModel = updateProgramResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateProgramResponseModel updateProgramResponseModelFromJson(String str) => UpdateProgramResponseModel.fromJson(json.decode(str));

String updateProgramResponseModelToJson(UpdateProgramResponseModel data) => json.encode(data.toJson());

class UpdateProgramResponseModel {
    UpdateProgramResponseModel({
        required this.applicationId,
        this.applicationStatus,
        this.applicationStatusName,
        required this.programId,
        required this.intekId,
        required this.institutionId,
        required this.isSubmited,
        required this.isSubmitedToInstitute,
        required this.termsAccepted,
        this.campus,
        required this.applicationMode,
        required this.citizenship,
        this.specializationId,
        required this.shoreType,
        required this.instCountry,
        required this.partnerTypeId,
        required this.instName,
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
        required this.b2ProgramId,
        required this.b3ProgramId,
        this.b1ProgramName,
        this.b2ProgramName,
        this.b3ProgramName,
        this.b1DurationTime,
        this.b2DurationTime,
        this.b3DurationTime,
        required this.b1TuitionFee,
        required this.b2TuitionFee,
        required this.b3TuitionFee,
        required this.primaryProgramId,
        this.primaryProgramName,
        this.primaryDurationTime,
        required this.primaryTuitionFee,
    });

    int applicationId;
    dynamic applicationStatus;
    dynamic applicationStatusName;
    int programId;
    int intekId;
    int institutionId;
    int isSubmited;
    int isSubmitedToInstitute;
    int termsAccepted;
    dynamic campus;
    int applicationMode;
    int citizenship;
    dynamic specializationId;
    int shoreType;
    int instCountry;
    int partnerTypeId;
    String instName;
    dynamic programName;
    dynamic intakeName;
    dynamic campusName;
    dynamic modeName;
    dynamic instCurrency;
    dynamic submissionDeadLine;
    dynamic durationTime;
    dynamic durationType;
    dynamic averageProcessingDay;
    dynamic instCostofLivingYear;
    dynamic isCreditCardRequired;
    dynamic reviewStatus;
    dynamic conditionalApplication;
    dynamic specializationName;
    dynamic onshoreSubmissionDeadline;
    dynamic partnerTypeName;
    dynamic b1ProgramId;
    String b2ProgramId;
    String b3ProgramId;
    dynamic b1ProgramName;
    dynamic b2ProgramName;
    dynamic b3ProgramName;
    dynamic b1DurationTime;
    dynamic b2DurationTime;
    dynamic b3DurationTime;
    int b1TuitionFee;
    int b2TuitionFee;
    int b3TuitionFee;
    int primaryProgramId;
    dynamic primaryProgramName;
    dynamic primaryDurationTime;
    int primaryTuitionFee;

    factory UpdateProgramResponseModel.fromJson(Map<String, dynamic> json) => UpdateProgramResponseModel(
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
        submissionDeadLine: json["SubmissionDeadLine"],
        durationTime: json["DurationTime"],
        durationType: json["DurationType"],
        averageProcessingDay: json["AverageProcessingDay"],
        instCostofLivingYear: json["InstCostofLiving_Year"],
        isCreditCardRequired: json["isCreditCardRequired"],
        reviewStatus: json["ReviewStatus"],
        conditionalApplication: json["ConditionalApplication"],
        specializationName: json["SpecializationName"],
        onshoreSubmissionDeadline: json["OnshoreSubmissionDeadline"],
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
        "SubmissionDeadLine": submissionDeadLine,
        "DurationTime": durationTime,
        "DurationType": durationType,
        "AverageProcessingDay": averageProcessingDay,
        "InstCostofLiving_Year": instCostofLivingYear,
        "isCreditCardRequired": isCreditCardRequired,
        "ReviewStatus": reviewStatus,
        "ConditionalApplication": conditionalApplication,
        "SpecializationName": specializationName,
        "OnshoreSubmissionDeadline": onshoreSubmissionDeadline,
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
