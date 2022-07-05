class ApplicationViewResponseModel {
  GenInfo? genInfo;
  EduInfo? eduInfo;
  TestScore? testScore;
  ProgramInfo? programInfo;
  OfferLetterInfo? offerLetterInfo;
  DeferredInfo? deferredInfo;
  StageInfo? stageInfo;
  var emergencyInfo;
  AbocodoInfo? abocodoInfo;

  ApplicationViewResponseModel(
      {this.genInfo,
      this.eduInfo,
      this.testScore,
      this.programInfo,
      this.offerLetterInfo,
      this.deferredInfo,
      this.stageInfo,
      this.emergencyInfo,
      this.abocodoInfo});

  ApplicationViewResponseModel.fromJson(Map<String, dynamic> json) {
    genInfo =
        json['genInfo'] != null ? new GenInfo.fromJson(json['genInfo']) : null;
    eduInfo =
        json['eduInfo'] != null ? new EduInfo.fromJson(json['eduInfo']) : null;
    testScore = json['testScore'] != null
        ? new TestScore.fromJson(json['testScore'])
        : null;
    programInfo = json['programInfo'] != null
        ? new ProgramInfo.fromJson(json['programInfo'])
        : null;
    offerLetterInfo = json['offerLetterInfo'] != null
        ? new OfferLetterInfo.fromJson(json['offerLetterInfo'])
        : null;
    deferredInfo = json['deferredInfo'] != null
        ? new DeferredInfo.fromJson(json['deferredInfo'])
        : null;
    stageInfo = json['stageInfo'] != null
        ? new StageInfo.fromJson(json['stageInfo'])
        : null;
    emergencyInfo = json['emergencyInfo'];
    abocodoInfo = json['abocodoInfo'] != null
        ? new AbocodoInfo.fromJson(json['abocodoInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genInfo != null) {
      data['genInfo'] = this.genInfo!.toJson();
    }
    if (this.eduInfo != null) {
      data['eduInfo'] = this.eduInfo!.toJson();
    }
    if (this.testScore != null) {
      data['testScore'] = this.testScore!.toJson();
    }
    if (this.programInfo != null) {
      data['programInfo'] = this.programInfo!.toJson();
    }
    if (this.offerLetterInfo != null) {
      data['offerLetterInfo'] = this.offerLetterInfo!.toJson();
    }
    if (this.deferredInfo != null) {
      data['deferredInfo'] = this.deferredInfo!.toJson();
    }
    if (this.stageInfo != null) {
      data['stageInfo'] = this.stageInfo!.toJson();
    }
    data['emergencyInfo'] = this.emergencyInfo;
    if (this.abocodoInfo != null) {
      data['abocodoInfo'] = this.abocodoInfo!.toJson();
    }
    return data;
  }
}

class GenInfo {
  int? applicationId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  String? dateOfBirth;
  String? addres;
  String? city;
  String? province;
  var country;
  String? pincode;
  String? mobileNo;
  String? email;
  String? maritialStatus;
  String? language;
  int? citizenship;
  String? passportNo;
  var enrollmentNo;
  int? studentId;
  int? assignedTo;
  int? agentId;
  String? passportExpiryDate;
  int? marketingManager;
  int? admissionExecutive;
  String? salution;
  var instUserID;
  String? mailingAddres;
  String? mailingCity;
  String? mailingProvince;
  var mailingCountry;
  String? mailingPincode;
  String? emrgencyName;
  String? emergencyEmail;
  String? emergencyRelation;
  String? emergencyHomePhone;
  String? emergencyCellPhone;
  String? emergencyBusinessPhone;
  String? emergencyAddress;
  String? emergencyCity;
  var emergencyProvince;
  var emergencyCountry;
  String? emergencyPincode;
  var appPassword;
  var mailingAddressSame;
  var emergencyAddressSame;
  var shoreType;
  String? mobileNoCountryCode;
  var emergencyHomePhoneCountryCode;
  var emergencyCellPhoneCountryCode;
  var emergencyBusinessPhoneCountryCode;
  var appCounsellorName;
  var appCounsellorEmail;
  var appCounsellorPhoneNo;
  String? countryName;
  String? citizenshipName;
  String? assignedToName;
  String? agentName;
  String? marketingManagerName;
  String? admissionExecutiveName;
  String? mailingCountryName;
  var emergencyCountryName;
  String? countryShortName;
  String? counsellorCity;
  String? counsellorCountry;
  String? counsellorEmailId;
  var houseNumber;
  var streetName;
  var area;
  var marketingManagerEmailId;
  String? abocodoMarketingMgrEmailId;

  GenInfo(
      {this.applicationId,
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
      this.instUserID,
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
      this.abocodoMarketingMgrEmailId});

  GenInfo.fromJson(Map<String, dynamic> json) {
    applicationId = json['ApplicationId'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    gender = json['Gender'];
    dateOfBirth = json['DateOfBirth'];
    addres = json['Addres'];
    city = json['City'];
    province = json['Province'];
    country = json['Country'];
    pincode = json['Pincode'];
    mobileNo = json['MobileNo'];
    email = json['Email'];
    maritialStatus = json['MaritialStatus'];
    language = json['Language'];
    citizenship = json['Citizenship'];
    passportNo = json['PassportNo'];
    enrollmentNo = json['EnrollmentNo'];
    studentId = json['StudentId'];
    assignedTo = json['AssignedTo'];
    agentId = json['AgentId'];
    passportExpiryDate = json['PassportExpiryDate'];
    marketingManager = json['MarketingManager'];
    admissionExecutive = json['AdmissionExecutive'];
    salution = json['Salution'];
    instUserID = json['InstUserID'];
    mailingAddres = json['MailingAddres'];
    mailingCity = json['MailingCity'];
    mailingProvince = json['MailingProvince'];
    mailingCountry = json['MailingCountry'];
    mailingPincode = json['MailingPincode'];
    emrgencyName = json['EmrgencyName'];
    emergencyEmail = json['EmergencyEmail'];
    emergencyRelation = json['EmergencyRelation'];
    emergencyHomePhone = json['EmergencyHomePhone'];
    emergencyCellPhone = json['EmergencyCellPhone'];
    emergencyBusinessPhone = json['EmergencyBusinessPhone'];
    emergencyAddress = json['EmergencyAddress'];
    emergencyCity = json['EmergencyCity'];
    emergencyProvince = json['EmergencyProvince'];
    emergencyCountry = json['EmergencyCountry'];
    emergencyPincode = json['EmergencyPincode'];
    appPassword = json['App_Password'];
    mailingAddressSame = json['MailingAddressSame'];
    emergencyAddressSame = json['EmergencyAddressSame'];
    shoreType = json['ShoreType'];
    mobileNoCountryCode = json['MobileNoCountryCode'];
    emergencyHomePhoneCountryCode = json['EmergencyHomePhoneCountryCode'];
    emergencyCellPhoneCountryCode = json['EmergencyCellPhoneCountryCode'];
    emergencyBusinessPhoneCountryCode =
        json['EmergencyBusinessPhoneCountryCode'];
    appCounsellorName = json['AppCounsellorName'];
    appCounsellorEmail = json['AppCounsellorEmail'];
    appCounsellorPhoneNo = json['AppCounsellorPhoneNo'];
    countryName = json['CountryName'];
    citizenshipName = json['CitizenshipName'];
    assignedToName = json['AssignedToName'];
    agentName = json['AgentName'];
    marketingManagerName = json['MarketingManagerName'];
    admissionExecutiveName = json['AdmissionExecutiveName'];
    mailingCountryName = json['MailingCountryName'];
    emergencyCountryName = json['EmergencyCountryName'];
    countryShortName = json['CountryShortName'];
    counsellorCity = json['CounsellorCity'];
    counsellorCountry = json['CounsellorCountry'];
    counsellorEmailId = json['CounsellorEmailId'];
    houseNumber = json['HouseNumber'];
    streetName = json['StreetName'];
    area = json['Area'];
    marketingManagerEmailId = json['MarketingManagerEmailId'];
    abocodoMarketingMgrEmailId = json['abocodoMarketingMgrEmailId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ApplicationId'] = this.applicationId;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['Gender'] = this.gender;
    data['DateOfBirth'] = this.dateOfBirth;
    data['Addres'] = this.addres;
    data['City'] = this.city;
    data['Province'] = this.province;
    data['Country'] = this.country;
    data['Pincode'] = this.pincode;
    data['MobileNo'] = this.mobileNo;
    data['Email'] = this.email;
    data['MaritialStatus'] = this.maritialStatus;
    data['Language'] = this.language;
    data['Citizenship'] = this.citizenship;
    data['PassportNo'] = this.passportNo;
    data['EnrollmentNo'] = this.enrollmentNo;
    data['StudentId'] = this.studentId;
    data['AssignedTo'] = this.assignedTo;
    data['AgentId'] = this.agentId;
    data['PassportExpiryDate'] = this.passportExpiryDate;
    data['MarketingManager'] = this.marketingManager;
    data['AdmissionExecutive'] = this.admissionExecutive;
    data['Salution'] = this.salution;
    data['InstUserID'] = this.instUserID;
    data['MailingAddres'] = this.mailingAddres;
    data['MailingCity'] = this.mailingCity;
    data['MailingProvince'] = this.mailingProvince;
    data['MailingCountry'] = this.mailingCountry;
    data['MailingPincode'] = this.mailingPincode;
    data['EmrgencyName'] = this.emrgencyName;
    data['EmergencyEmail'] = this.emergencyEmail;
    data['EmergencyRelation'] = this.emergencyRelation;
    data['EmergencyHomePhone'] = this.emergencyHomePhone;
    data['EmergencyCellPhone'] = this.emergencyCellPhone;
    data['EmergencyBusinessPhone'] = this.emergencyBusinessPhone;
    data['EmergencyAddress'] = this.emergencyAddress;
    data['EmergencyCity'] = this.emergencyCity;
    data['EmergencyProvince'] = this.emergencyProvince;
    data['EmergencyCountry'] = this.emergencyCountry;
    data['EmergencyPincode'] = this.emergencyPincode;
    data['App_Password'] = this.appPassword;
    data['MailingAddressSame'] = this.mailingAddressSame;
    data['EmergencyAddressSame'] = this.emergencyAddressSame;
    data['ShoreType'] = this.shoreType;
    data['MobileNoCountryCode'] = this.mobileNoCountryCode;
    data['EmergencyHomePhoneCountryCode'] = this.emergencyHomePhoneCountryCode;
    data['EmergencyCellPhoneCountryCode'] = this.emergencyCellPhoneCountryCode;
    data['EmergencyBusinessPhoneCountryCode'] =
        this.emergencyBusinessPhoneCountryCode;
    data['AppCounsellorName'] = this.appCounsellorName;
    data['AppCounsellorEmail'] = this.appCounsellorEmail;
    data['AppCounsellorPhoneNo'] = this.appCounsellorPhoneNo;
    data['CountryName'] = this.countryName;
    data['CitizenshipName'] = this.citizenshipName;
    data['AssignedToName'] = this.assignedToName;
    data['AgentName'] = this.agentName;
    data['MarketingManagerName'] = this.marketingManagerName;
    data['AdmissionExecutiveName'] = this.admissionExecutiveName;
    data['MailingCountryName'] = this.mailingCountryName;
    data['EmergencyCountryName'] = this.emergencyCountryName;
    data['CountryShortName'] = this.countryShortName;
    data['CounsellorCity'] = this.counsellorCity;
    data['CounsellorCountry'] = this.counsellorCountry;
    data['CounsellorEmailId'] = this.counsellorEmailId;
    data['HouseNumber'] = this.houseNumber;
    data['StreetName'] = this.streetName;
    data['Area'] = this.area;
    data['MarketingManagerEmailId'] = this.marketingManagerEmailId;
    data['abocodoMarketingMgrEmailId'] = this.abocodoMarketingMgrEmailId;
    return data;
  }
}

class EduInfo {
  int? applicationId;
  var countryOfEducation;
  var highestLevelOfEducation;
  var gradingScheme;
  String? gradeAverage;
  var graduatedMostRecent;
  var eduYearStart;
  var eduYearEnd;
  String? gradingSchemeName;
  String? highestLevelOfEducationName;
  String? countryOfEducationName;

  EduInfo(
      {this.applicationId,
      this.countryOfEducation,
      this.highestLevelOfEducation,
      this.gradingScheme,
      this.gradeAverage,
      this.graduatedMostRecent,
      this.eduYearStart,
      this.eduYearEnd,
      this.gradingSchemeName,
      this.highestLevelOfEducationName,
      this.countryOfEducationName});

  EduInfo.fromJson(Map<String, dynamic> json) {
    applicationId = json['ApplicationId'];
    countryOfEducation = json['CountryOfEducation'];
    highestLevelOfEducation = json['HighestLevelOfEducation'];
    gradingScheme = json['GradingScheme'];
    gradeAverage = json['GradeAverage'];
    graduatedMostRecent = json['GraduatedMostRecent'];
    eduYearStart = json['EduYearStart'];
    eduYearEnd = json['EduYearEnd'];
    gradingSchemeName = json['GradingSchemeName'];
    highestLevelOfEducationName = json['HighestLevelOfEducationName'];
    countryOfEducationName = json['CountryOfEducationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ApplicationId'] = this.applicationId;
    data['CountryOfEducation'] = this.countryOfEducation;
    data['HighestLevelOfEducation'] = this.highestLevelOfEducation;
    data['GradingScheme'] = this.gradingScheme;
    data['GradeAverage'] = this.gradeAverage;
    data['GraduatedMostRecent'] = this.graduatedMostRecent;
    data['EduYearStart'] = this.eduYearStart;
    data['EduYearEnd'] = this.eduYearEnd;
    data['GradingSchemeName'] = this.gradingSchemeName;
    data['HighestLevelOfEducationName'] = this.highestLevelOfEducationName;
    data['CountryOfEducationName'] = this.countryOfEducationName;
    return data;
  }
}

class TestScore {
  int? applicationId;
  String? englishExamName;
  var englishExamType;
  String? englishExamDate;
  double? englishScoreL;
  double? englishScoreR;
  double? englishScoreW;
  double? englishScoreS;
  String? gREExamDate;
  double? gREScoreV;
  double? gREScoreQ;
  double? gREScoreW;
  String? gMATExamDate;
  double? gMATScoreA;
  double? gMATScoreI;
  double? gMATScoreQ;
  double? gMATScoreV;
  var gREExam;
  int? gMATExam;
  String? gMATExamName;
  double? englishScoreOverall;
  String? englishExamUser;
  String? englishExamPswd;
  String? englishExamRemark;
  double? sATScoreTotal;
  double? sATScoreMath;
  double? sATScoreEBRW;
  double? aCTScoreTotal;
  double? aCTScoreEnglish;
  double? aCTScoreMath;
  double? aCTScoreReading;
  double? aCTScoreScience;
  double? aCTScoreWriting;
  String? englishExamDocPath;
  String? otherExamDocPath;

  TestScore(
      {this.applicationId,
      this.englishExamName,
      this.englishExamType,
      this.englishExamDate,
      this.englishScoreL,
      this.englishScoreR,
      this.englishScoreW,
      this.englishScoreS,
      this.gREExamDate,
      this.gREScoreV,
      this.gREScoreQ,
      this.gREScoreW,
      this.gMATExamDate,
      this.gMATScoreA,
      this.gMATScoreI,
      this.gMATScoreQ,
      this.gMATScoreV,
      this.gREExam,
      this.gMATExam,
      this.gMATExamName,
      this.englishScoreOverall,
      this.englishExamUser,
      this.englishExamPswd,
      this.englishExamRemark,
      this.sATScoreTotal,
      this.sATScoreMath,
      this.sATScoreEBRW,
      this.aCTScoreTotal,
      this.aCTScoreEnglish,
      this.aCTScoreMath,
      this.aCTScoreReading,
      this.aCTScoreScience,
      this.aCTScoreWriting,
      this.englishExamDocPath,
      this.otherExamDocPath});

  TestScore.fromJson(Map<String, dynamic> json) {
    applicationId = json['ApplicationId'];
    englishExamName = json['EnglishExamName'];
    englishExamType = json['EnglishExamType'];
    englishExamDate = json['EnglishExamDate'];
    englishScoreL = json['EnglishScoreL'];
    englishScoreR = json['EnglishScoreR'];
    englishScoreW = json['EnglishScoreW'];
    englishScoreS = json['EnglishScoreS'];
    gREExamDate = json['GREExamDate'];
    gREScoreV = json['GREScoreV'];
    gREScoreQ = json['GREScoreQ'];
    gREScoreW = json['GREScoreW'];
    gMATExamDate = json['GMATExamDate'];
    gMATScoreA = json['GMATScoreA'];
    gMATScoreI = json['GMATScoreI'];
    gMATScoreQ = json['GMATScoreQ'];
    gMATScoreV = json['GMATScoreV'];
    gREExam = json['GREExam'];
    gMATExam = json['GMATExam'];
    gMATExamName = json['GMATExamName'];
    englishScoreOverall = json['EnglishScoreOverall'];
    englishExamUser = json['EnglishExamUser'];
    englishExamPswd = json['EnglishExamPswd'];
    englishExamRemark = json['EnglishExamRemark'];
    sATScoreTotal = json['SATScoreTotal'];
    sATScoreMath = json['SATScoreMath'];
    sATScoreEBRW = json['SATScoreEBRW'];
    aCTScoreTotal = json['ACTScoreTotal'];
    aCTScoreEnglish = json['ACTScoreEnglish'];
    aCTScoreMath = json['ACTScoreMath'];
    aCTScoreReading = json['ACTScoreReading'];
    aCTScoreScience = json['ACTScoreScience'];
    aCTScoreWriting = json['ACTScoreWriting'];
    englishExamDocPath = json['EnglishExamDocPath'];
    otherExamDocPath = json['OtherExamDocPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ApplicationId'] = this.applicationId;
    data['EnglishExamName'] = this.englishExamName;
    data['EnglishExamType'] = this.englishExamType;
    data['EnglishExamDate'] = this.englishExamDate;
    data['EnglishScoreL'] = this.englishScoreL;
    data['EnglishScoreR'] = this.englishScoreR;
    data['EnglishScoreW'] = this.englishScoreW;
    data['EnglishScoreS'] = this.englishScoreS;
    data['GREExamDate'] = this.gREExamDate;
    data['GREScoreV'] = this.gREScoreV;
    data['GREScoreQ'] = this.gREScoreQ;
    data['GREScoreW'] = this.gREScoreW;
    data['GMATExamDate'] = this.gMATExamDate;
    data['GMATScoreA'] = this.gMATScoreA;
    data['GMATScoreI'] = this.gMATScoreI;
    data['GMATScoreQ'] = this.gMATScoreQ;
    data['GMATScoreV'] = this.gMATScoreV;
    data['GREExam'] = this.gREExam;
    data['GMATExam'] = this.gMATExam;
    data['GMATExamName'] = this.gMATExamName;
    data['EnglishScoreOverall'] = this.englishScoreOverall;
    data['EnglishExamUser'] = this.englishExamUser;
    data['EnglishExamPswd'] = this.englishExamPswd;
    data['EnglishExamRemark'] = this.englishExamRemark;
    data['SATScoreTotal'] = this.sATScoreTotal;
    data['SATScoreMath'] = this.sATScoreMath;
    data['SATScoreEBRW'] = this.sATScoreEBRW;
    data['ACTScoreTotal'] = this.aCTScoreTotal;
    data['ACTScoreEnglish'] = this.aCTScoreEnglish;
    data['ACTScoreMath'] = this.aCTScoreMath;
    data['ACTScoreReading'] = this.aCTScoreReading;
    data['ACTScoreScience'] = this.aCTScoreScience;
    data['ACTScoreWriting'] = this.aCTScoreWriting;
    data['EnglishExamDocPath'] = this.englishExamDocPath;
    data['OtherExamDocPath'] = this.otherExamDocPath;
    return data;
  }
}

class ProgramInfo {
  int? applicationId;
  int? applicationStatus;
  String? applicationStatusName;
  int? programId;
  int? intekId;
  int? institutionId;
  int? isSubmited;
  int? isSubmitedToInstitute;
  int? termsAccepted;
  var campus;
  var applicationMode;
  var citizenship;
  var specializationId;
  int? shoreType;
  int? instCountry;
  int? partnerTypeId;
  String? instName;
  String? programName;
  String? intakeName;
  String? campusName;
  String? modeName;
  String? instCurrency;
  String? submissionDeadLine;
  String? durationTime;
  int? durationType;
  String? averageProcessingDay;
  String? instCostofLivingYear;
  bool? isCreditCardRequired;
  int? reviewStatus;
  int? conditionalApplication;
  var specializationName;
  String? onshoreSubmissionDeadline;
  String? partnerTypeName;
  var b1ProgramId;
  var b2ProgramId;
  var b3ProgramId;
  var b1ProgramName;
  var b2ProgramName;
  var b3ProgramName;
  var b1DurationTime;
  var b2DurationTime;
  var b3DurationTime;
  double? b1TuitionFee;
  double? b2TuitionFee;
  double? b3TuitionFee;

  ProgramInfo(
      {this.applicationId,
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
      this.b3TuitionFee});

  ProgramInfo.fromJson(Map<String, dynamic> json) {
    applicationId = json['ApplicationId'];
    applicationStatus = json['ApplicationStatus'];
    applicationStatusName = json['ApplicationStatusName'];
    programId = json['ProgramId'];
    intekId = json['IntekId'];
    institutionId = json['InstitutionId'];
    isSubmited = json['isSubmited'];
    isSubmitedToInstitute = json['isSubmitedToInstitute'];
    termsAccepted = json['termsAccepted'];
    campus = json['Campus'];
    applicationMode = json['ApplicationMode'];
    citizenship = json['Citizenship'];
    specializationId = json['SpecializationId'];
    shoreType = json['ShoreType'];
    instCountry = json['InstCountry'];
    partnerTypeId = json['PartnerTypeId'];
    instName = json['InstName'];
    programName = json['ProgramName'];
    intakeName = json['IntakeName'];
    campusName = json['CampusName'];
    modeName = json['ModeName'];
    instCurrency = json['InstCurrency'];
    submissionDeadLine = json['SubmissionDeadLine'];
    durationTime = json['DurationTime'];
    durationType = json['DurationType'];
    averageProcessingDay = json['AverageProcessingDay'];
    instCostofLivingYear = json['InstCostofLiving_Year'];
    isCreditCardRequired = json['isCreditCardRequired'];
    reviewStatus = json['ReviewStatus'];
    conditionalApplication = json['ConditionalApplication'];
    specializationName = json['SpecializationName'];
    onshoreSubmissionDeadline = json['OnshoreSubmissionDeadline'];
    partnerTypeName = json['PartnerTypeName'];
    b1ProgramId = json['B1ProgramId'];
    b2ProgramId = json['B2ProgramId'];
    b3ProgramId = json['B3ProgramId'];
    b1ProgramName = json['B1ProgramName'];
    b2ProgramName = json['B2ProgramName'];
    b3ProgramName = json['B3ProgramName'];
    b1DurationTime = json['B1DurationTime'];
    b2DurationTime = json['B2DurationTime'];
    b3DurationTime = json['B3DurationTime'];
    b1TuitionFee = json['B1TuitionFee'];
    b2TuitionFee = json['B2TuitionFee'];
    b3TuitionFee = json['B3TuitionFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ApplicationId'] = this.applicationId;
    data['ApplicationStatus'] = this.applicationStatus;
    data['ApplicationStatusName'] = this.applicationStatusName;
    data['ProgramId'] = this.programId;
    data['IntekId'] = this.intekId;
    data['InstitutionId'] = this.institutionId;
    data['isSubmited'] = this.isSubmited;
    data['isSubmitedToInstitute'] = this.isSubmitedToInstitute;
    data['termsAccepted'] = this.termsAccepted;
    data['Campus'] = this.campus;
    data['ApplicationMode'] = this.applicationMode;
    data['Citizenship'] = this.citizenship;
    data['SpecializationId'] = this.specializationId;
    data['ShoreType'] = this.shoreType;
    data['InstCountry'] = this.instCountry;
    data['PartnerTypeId'] = this.partnerTypeId;
    data['InstName'] = this.instName;
    data['ProgramName'] = this.programName;
    data['IntakeName'] = this.intakeName;
    data['CampusName'] = this.campusName;
    data['ModeName'] = this.modeName;
    data['InstCurrency'] = this.instCurrency;
    data['SubmissionDeadLine'] = this.submissionDeadLine;
    data['DurationTime'] = this.durationTime;
    data['DurationType'] = this.durationType;
    data['AverageProcessingDay'] = this.averageProcessingDay;
    data['InstCostofLiving_Year'] = this.instCostofLivingYear;
    data['isCreditCardRequired'] = this.isCreditCardRequired;
    data['ReviewStatus'] = this.reviewStatus;
    data['ConditionalApplication'] = this.conditionalApplication;
    data['SpecializationName'] = this.specializationName;
    data['OnshoreSubmissionDeadline'] = this.onshoreSubmissionDeadline;
    data['PartnerTypeName'] = this.partnerTypeName;
    data['B1ProgramId'] = this.b1ProgramId;
    data['B2ProgramId'] = this.b2ProgramId;
    data['B3ProgramId'] = this.b3ProgramId;
    data['B1ProgramName'] = this.b1ProgramName;
    data['B2ProgramName'] = this.b2ProgramName;
    data['B3ProgramName'] = this.b3ProgramName;
    data['B1DurationTime'] = this.b1DurationTime;
    data['B2DurationTime'] = this.b2DurationTime;
    data['B3DurationTime'] = this.b3DurationTime;
    data['B1TuitionFee'] = this.b1TuitionFee;
    data['B2TuitionFee'] = this.b2TuitionFee;
    data['B3TuitionFee'] = this.b3TuitionFee;
    return data;
  }
}

class OfferLetterInfo {
  int? applicationId;
  var offerLetterPath;
  var offerLetterUser;

  OfferLetterInfo(
      {this.applicationId, this.offerLetterPath, this.offerLetterUser});

  OfferLetterInfo.fromJson(Map<String, dynamic> json) {
    applicationId = json['ApplicationId'];
    offerLetterPath = json['OfferLetterPath'];
    offerLetterUser = json['OfferLetterUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ApplicationId'] = this.applicationId;
    data['OfferLetterPath'] = this.offerLetterPath;
    data['OfferLetterUser'] = this.offerLetterUser;
    return data;
  }
}

class DeferredInfo {
  var isDeferred;
  var newIntakeName;
  var newIntekId;

  DeferredInfo({this.isDeferred, this.newIntakeName, this.newIntekId});

  DeferredInfo.fromJson(Map<String, dynamic> json) {
    isDeferred = json['IsDeferred'];
    newIntakeName = json['NewIntakeName'];
    newIntekId = json['NewIntekId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsDeferred'] = this.isDeferred;
    data['NewIntakeName'] = this.newIntakeName;
    data['NewIntekId'] = this.newIntekId;
    return data;
  }
}

class StageInfo {
  int? submitted;
  var submittedDate;
  int? submittedToInstitute;
  var reviewDoneDate;
  int? reviewDone;
  var submittedToInstituteDate;
  var refundStatus;
  var refundStatusDate;
  var preDepartureDate;
  int? isPreAstmntDone;
  var preAstmntDate;
  var preAstmntRemark;
  var sEVISID;

  StageInfo(
      {this.submitted,
      this.submittedDate,
      this.submittedToInstitute,
      this.reviewDoneDate,
      this.reviewDone,
      this.submittedToInstituteDate,
      this.refundStatus,
      this.refundStatusDate,
      this.preDepartureDate,
      this.isPreAstmntDone,
      this.preAstmntDate,
      this.preAstmntRemark,
      this.sEVISID});

  StageInfo.fromJson(Map<String, dynamic> json) {
    submitted = json['Submitted'];
    submittedDate = json['SubmittedDate'];
    submittedToInstitute = json['SubmittedToInstitute'];
    reviewDoneDate = json['ReviewDoneDate'];
    reviewDone = json['ReviewDone'];
    submittedToInstituteDate = json['SubmittedToInstituteDate'];
    refundStatus = json['RefundStatus'];
    refundStatusDate = json['RefundStatusDate'];
    preDepartureDate = json['PreDepartureDate'];
    isPreAstmntDone = json['isPreAstmntDone'];
    preAstmntDate = json['PreAstmntDate'];
    preAstmntRemark = json['PreAstmntRemark'];
    sEVISID = json['SEVISID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Submitted'] = this.submitted;
    data['SubmittedDate'] = this.submittedDate;
    data['SubmittedToInstitute'] = this.submittedToInstitute;
    data['ReviewDoneDate'] = this.reviewDoneDate;
    data['ReviewDone'] = this.reviewDone;
    data['SubmittedToInstituteDate'] = this.submittedToInstituteDate;
    data['RefundStatus'] = this.refundStatus;
    data['RefundStatusDate'] = this.refundStatusDate;
    data['PreDepartureDate'] = this.preDepartureDate;
    data['isPreAstmntDone'] = this.isPreAstmntDone;
    data['PreAstmntDate'] = this.preAstmntDate;
    data['PreAstmntRemark'] = this.preAstmntRemark;
    data['SEVISID'] = this.sEVISID;
    return data;
  }
}

class AbocodoInfo {
  int? abocodoAdmissionExecutive;
  String? abocodoAdmExecName;
  int? abocodoMarketingManager;
  String? abocodoMarketingMgrName;
  int? secondaryAgentId;
  String? secondaryAgentName;
  var isSubmittedToGMO;
  int? isSubmittedToGMOUser;
  var submittedToGMOUserName;

  AbocodoInfo(
      {this.abocodoAdmissionExecutive,
      this.abocodoAdmExecName,
      this.abocodoMarketingManager,
      this.abocodoMarketingMgrName,
      this.secondaryAgentId,
      this.secondaryAgentName,
      this.isSubmittedToGMO,
      this.isSubmittedToGMOUser,
      this.submittedToGMOUserName});

  AbocodoInfo.fromJson(Map<String, dynamic> json) {
    abocodoAdmissionExecutive = json['AbocodoAdmissionExecutive'];
    abocodoAdmExecName = json['AbocodoAdmExecName'];
    abocodoMarketingManager = json['AbocodoMarketingManager'];
    abocodoMarketingMgrName = json['AbocodoMarketingMgrName'];
    secondaryAgentId = json['SecondaryAgentId'];
    secondaryAgentName = json['SecondaryAgentName'];
    isSubmittedToGMO = json['IsSubmittedToGMO'];
    isSubmittedToGMOUser = json['IsSubmittedToGMOUser'];
    submittedToGMOUserName = json['SubmittedToGMOUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AbocodoAdmissionExecutive'] = this.abocodoAdmissionExecutive;
    data['AbocodoAdmExecName'] = this.abocodoAdmExecName;
    data['AbocodoMarketingManager'] = this.abocodoMarketingManager;
    data['AbocodoMarketingMgrName'] = this.abocodoMarketingMgrName;
    data['SecondaryAgentId'] = this.secondaryAgentId;
    data['SecondaryAgentName'] = this.secondaryAgentName;
    data['IsSubmittedToGMO'] = this.isSubmittedToGMO;
    data['IsSubmittedToGMOUser'] = this.isSubmittedToGMOUser;
    data['SubmittedToGMOUserName'] = this.submittedToGMOUserName;
    return data;
  }
}
