// To parse this JSON data, do
//
//     final getProgramListFilterResponseModel = getProgramListFilterResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProgramListWithOtherInfoResponseModel>
    getProgramListFilterResponseModelFromJson(String str) =>
        List<ProgramListWithOtherInfoResponseModel>.from(json
            .decode(str)
            .map((x) => ProgramListWithOtherInfoResponseModel.fromJson(x)));

String getProgramListFilterResponseModelToJson(
        List<ProgramListWithOtherInfoResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgramListWithOtherInfoResponseModel {
  ProgramListWithOtherInfoResponseModel({
    this.institutionId,
    this.instName,
    this.instLogoPath,
    this.instCountry,
    this.instProvince,
    this.instCity,
    this.commission,
    this.partnerTypeId,
    this.instTile,
    this.isViaAbcodo,
    this.programs,
  });

  int? institutionId;
  InstName? instName;
  String? instLogoPath;
  InstCountry? instCountry;
  String? instProvince;
  String? instCity;
  double? commission;
  int? partnerTypeId;
  String? instTile;
  int? isViaAbcodo;
  List<Program>? programs;

  factory ProgramListWithOtherInfoResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ProgramListWithOtherInfoResponseModel(
        institutionId: json["InstitutionId"],
        instName: instNameValues.map[json["InstName"]],
        instLogoPath: json["InstLogoPath"],
        instCountry: instCountryValues.map[json["InstCountry"]],
        instProvince: json["InstProvince"],
        instCity: json["InstCity"],
        commission: json["Commission"],
        partnerTypeId: json["PartnerTypeId"],
        instTile: json["InstTile"],
        isViaAbcodo: json["isViaAbcodo"],
        programs: List<Program>.from(
            json["programs"].map((x) => Program.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "InstitutionId": institutionId,
        "InstName": instNameValues.reverse![instName],
        "InstLogoPath": instLogoPath,
        "InstCountry": instCountryValues.reverse![instCountry],
        "InstProvince": instProvince,
        "InstCity": instCity,
        "Commission": commission,
        "PartnerTypeId": partnerTypeId,
        "InstTile": instTile,
        "isViaAbcodo": isViaAbcodo,
        "programs": List<dynamic>.from(programs!.map((x) => x.toJson())),
      };
}

enum InstCountry { CANADA, UNITED_STATES_USA }

final instCountryValues = EnumValues({
  "Canada": InstCountry.CANADA,
  "United States (USA)": InstCountry.UNITED_STATES_USA
});

enum InstName {
  ETON_COLLEGE,
  HAWAII_PACIFIC_UNIVERSITY,
  UNIVERSITY_OF_CHARLESTON
}

final instNameValues = EnumValues({
  "Eton College": InstName.ETON_COLLEGE,
  "Hawaii Pacific University": InstName.HAWAII_PACIFIC_UNIVERSITY,
  "University of Charleston": InstName.UNIVERSITY_OF_CHARLESTON
});

class Program {
  Program({
    this.programId,
    this.programName,
    this.durationTime,
    this.durationType,
    this.noOfSemester,
    this.offerLetterTat,
    this.programCurrency,
    this.programLevel,
    this.programLink,
    this.averageProcessingDay,
    this.programStatus,
    this.waiverPer,
    this.applicationFee,
    this.applicationFeeAfterWaiver,
    this.scholarShipAmtType,
    this.scholarShipMinAmt,
    this.scholarShipMaxAmt,
    this.institutionName,
    this.partnerTypeName,
    this.startDate,
    this.endDate,
    this.campus,
    this.feeDetail,
    this.intakes,
  });

  int? programId;
  String? programName;
  String? durationTime;
  int? durationType;
  int? noOfSemester;
  String? offerLetterTat;
  ProgramCurrency? programCurrency;
  ProgramLevel? programLevel;
  String? programLink;
  String? averageProcessingDay;
  ProgramStatus? programStatus;
  double? waiverPer;
  double? applicationFee;
  double? applicationFeeAfterWaiver;
  dynamic scholarShipAmtType;
  dynamic scholarShipMinAmt;
  dynamic scholarShipMaxAmt;
  InstName? institutionName;
  PartnerTypeName? partnerTypeName;
  DateTime? startDate;
  DateTime? endDate;
  List<Campus>? campus;
  List<FeeDetail>? feeDetail;
  List<Intake>? intakes;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        programId: json["ProgramId"],
        programName: json["ProgramName"],
        durationTime: json["DurationTime"],
        durationType: json["DurationType"],
        noOfSemester: json["NoOfSemester"],
        offerLetterTat: json["OfferLetterTAT"],
        programCurrency: programCurrencyValues.map[json["ProgramCurrency"]],
        programLevel: programLevelValues.map[json["ProgramLevel"]],
        programLink: json["ProgramLink"],
        averageProcessingDay: json["AverageProcessingDay"],
        programStatus: programStatusValues.map[json["ProgramStatus"]],
        waiverPer: json["WaiverPer"],
        applicationFee: json["ApplicationFee"],
        applicationFeeAfterWaiver: json["ApplicationFeeAfterWaiver"],
        scholarShipAmtType: json["ScholarShipAmtType"],
        scholarShipMinAmt: json["ScholarShipMinAmt"],
        scholarShipMaxAmt: json["ScholarShipMaxAmt"],
        institutionName: instNameValues.map[json["InstitutionName"]],
        partnerTypeName: partnerTypeNameValues.map[json["PartnerTypeName"]],
        startDate: DateTime.parse(json["StartDate"]),
        endDate: DateTime.parse(json["EndDate"]),
        campus:
            List<Campus>.from(json["campus"].map((x) => Campus.fromJson(x))),
        feeDetail: List<FeeDetail>.from(
            json["FeeDetail"].map((x) => FeeDetail.fromJson(x))),
        intakes:
            List<Intake>.from(json["Intakes"].map((x) => Intake.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ProgramId": programId,
        "ProgramName": programName,
        "DurationTime": durationTime,
        "DurationType": durationType,
        "NoOfSemester": noOfSemester,
        "OfferLetterTAT": offerLetterTat,
        "ProgramCurrency": programCurrencyValues.reverse![programCurrency],
        "ProgramLevel": programLevelValues.reverse![programLevel],
        "ProgramLink": programLink,
        "AverageProcessingDay": averageProcessingDay,
        "ProgramStatus": programStatusValues.reverse![programStatus],
        "WaiverPer": waiverPer,
        "ApplicationFee": applicationFee,
        "ApplicationFeeAfterWaiver": applicationFeeAfterWaiver,
        "ScholarShipAmtType": scholarShipAmtType,
        "ScholarShipMinAmt": scholarShipMinAmt,
        "ScholarShipMaxAmt": scholarShipMaxAmt,
        "InstitutionName": instNameValues.reverse![institutionName],
        "PartnerTypeName": partnerTypeNameValues.reverse![partnerTypeName],
        "StartDate": startDate!.toIso8601String(),
        "EndDate": endDate!.toIso8601String(),
        "campus": List<dynamic>.from(campus!.map((x) => x.toJson())),
        "FeeDetail": List<dynamic>.from(feeDetail!.map((x) => x.toJson())),
        "Intakes": List<dynamic>.from(intakes!.map((x) => x.toJson())),
      };
}

class Campus {
  Campus({
    this.campusName,
    this.city,
    this.countryName,
  });

  CampusName? campusName;
  City? city;
  InstCountry? countryName;

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        campusName: campusNameValues.map[json["CampusName"]],
        city: cityValues.map[json["City"]],
        countryName: instCountryValues.map[json["CountryName"]],
      );

  Map<String, dynamic> toJson() => {
        "CampusName": campusNameValues.reverse![campusName],
        "City": cityValues.reverse![city],
        "CountryName": instCountryValues.reverse![countryName],
      };
}

enum CampusName { VANCOUVER, HAWAII, CHARLESTON_WEST_VIRGINIA_USA }

final campusNameValues = EnumValues({
  "Charleston, West Virginia, USA ": CampusName.CHARLESTON_WEST_VIRGINIA_USA,
  "Hawaii": CampusName.HAWAII,
  "Vancouver": CampusName.VANCOUVER
});

enum City { VANCOUVER, HONULULU, CHARLESTON }

final cityValues = EnumValues({
  "Charleston": City.CHARLESTON,
  "Honululu": City.HONULULU,
  "Vancouver": City.VANCOUVER
});

class FeeDetail {
  FeeDetail({
    this.feeId,
    this.feeType,
    this.feeBasis,
    this.feeAmount,
  });

  int? feeId;
  FeeType? feeType;
  FeeBasis? feeBasis;
  double? feeAmount;

  factory FeeDetail.fromJson(Map<String, dynamic> json) => FeeDetail(
        feeId: json["FeeId"],
        feeType: feeTypeValues.map[json["FeeType"]],
        feeBasis: feeBasisValues.map[json["FeeBasis"]],
        feeAmount: json["FeeAmount"],
      );

  Map<String, dynamic> toJson() => {
        "FeeId": feeId,
        "FeeType": feeTypeValues.reverse![feeType],
        "FeeBasis": feeBasisValues.reverse![feeBasis],
        "FeeAmount": feeAmount,
      };
}

enum FeeBasis { ONE_TIME, PER_SEMESTER, PER_YEAR }

final feeBasisValues = EnumValues({
  "one-time": FeeBasis.ONE_TIME,
  "per semester": FeeBasis.PER_SEMESTER,
  "per year": FeeBasis.PER_YEAR
});

enum FeeType {
  APPLICATION_FEE,
  MINIMUM_DEPOSIT,
  TUITION_FEE,
  ENROLLMENT_DEPOSIT,
  SEVIS_FEES,
  VISA_FEES
}

final feeTypeValues = EnumValues({
  "Application Fee": FeeType.APPLICATION_FEE,
  "Enrollment Deposit": FeeType.ENROLLMENT_DEPOSIT,
  "Minimum Deposit": FeeType.MINIMUM_DEPOSIT,
  "SEVIS Fees": FeeType.SEVIS_FEES,
  "Tuition Fee": FeeType.TUITION_FEE,
  "VISA Fees": FeeType.VISA_FEES
});

class Intake {
  Intake({
    this.intakeName,
    this.statusName,
  });

  IntakeName? intakeName;
  ProgramStatus? statusName;

  factory Intake.fromJson(Map<String, dynamic> json) => Intake(
        intakeName: intakeNameValues.map[json["IntakeName"]],
        statusName: programStatusValues.map[json["StatusName"]],
      );

  Map<String, dynamic> toJson() => {
        "IntakeName": intakeNameValues.reverse![intakeName],
        "StatusName": programStatusValues.reverse![statusName],
      };
}

enum IntakeName { JUL_2022, SEP_2022 }

final intakeNameValues = EnumValues(
    {"Jul-2022": IntakeName.JUL_2022, "Sep-2022": IntakeName.SEP_2022});

enum ProgramStatus { OPEN }

final programStatusValues = EnumValues({"Open": ProgramStatus.OPEN});

enum PartnerTypeName { GMO }

final partnerTypeNameValues = EnumValues({"GMO": PartnerTypeName.GMO});

enum ProgramCurrency { CAD, USD }

final programCurrencyValues =
    EnumValues({"CAD": ProgramCurrency.CAD, "USD": ProgramCurrency.USD});

enum ProgramLevel {
  DIPLOMA_1_YEAR,
  DIPLOMA_2_YEAR_UG,
  CERTIFICATION,
  UNDERGRADUATE,
  DOCTORATE,
  GRADUATE,
  BACHELORS_DEGREE_4_YEAR
}

final programLevelValues = EnumValues({
  "Bachelors Degree (4-Year)": ProgramLevel.BACHELORS_DEGREE_4_YEAR,
  "Certification": ProgramLevel.CERTIFICATION,
  "Diploma (1 Year)": ProgramLevel.DIPLOMA_1_YEAR,
  "Diploma (2-Year UG)": ProgramLevel.DIPLOMA_2_YEAR_UG,
  "Doctorate": ProgramLevel.DOCTORATE,
  "Graduate": ProgramLevel.GRADUATE,
  "Undergraduate": ProgramLevel.UNDERGRADUATE
});

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
