class AddStudentRequestModel {
  GenInfo? genInfo;
  ProgramInfo? programInfo;
  EduInfo? eduInfo;
  TestScore? testScore;

  AddStudentRequestModel({
    this.genInfo,
    this.programInfo,
    this.eduInfo,
    this.testScore,
  });

  AddStudentRequestModel.fromJson(Map<String, dynamic> json) {
    genInfo =
        json['genInfo'] != null ? new GenInfo.fromJson(json['genInfo']) : null;
    programInfo = json['programInfo'] != null
        ? new ProgramInfo.fromJson(json['programInfo'])
        : null;
    eduInfo =
        json['eduInfo'] != null ? new EduInfo.fromJson(json['eduInfo']) : null;
    testScore = json['testScore'] != null
        ? new TestScore.fromJson(json['testScore'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genInfo != null) {
      data['genInfo'] = this.genInfo!.toJson();
    }
    if (this.programInfo != null) {
      data['programInfo'] = this.programInfo!.toJson();
    }
    if (this.eduInfo != null) {
      data['eduInfo'] = this.eduInfo!.toJson();
    }
    if (this.testScore != null) {
      data['testScore'] = this.testScore!.toJson();
    }
    return data;
  }
}

class GenInfo {
  int? agentId;
  String? salution;
  String? gender;
  String? firstName;
  String? middleName;
  String? lastName;
  String? maritialStatus;
  String? dateOfBirth;
  String? language;
  String? email;
  String? mobileNoCountryCode;
  String? mobileNo;
  int? citizenship;
  String? passportNo;
  String? passportExpiryDate;
  bool? mailingAddressSame;
  String? mailingAddres;
  int? mailingCountry;
  int? mailingProvince;
  String? mailingCity;
  String? mailingPincode;
  String? addres;
  int? country;
  int? province;
  String? city;
  String? pincode;
  int? emergencyProvince;
  String? emrgencyName;
  String? emergencyRelation;
  String? emergencyEmail;
  String? emergencyCellPhoneCountryCode;
  String? emergencyCellPhone;
  String? emergencyBusinessPhoneCountryCode;
  String? emergencyBusinessPhone;

  GenInfo(
      {this.agentId,
      this.salution,
      this.gender,
      this.firstName,
      this.middleName,
      this.lastName,
      this.maritialStatus,
      this.dateOfBirth,
      this.language,
      this.email,
      this.mobileNoCountryCode,
      this.mobileNo,
      this.citizenship,
      this.passportNo,
      this.passportExpiryDate,
      this.mailingAddressSame,
      this.mailingAddres,
      this.mailingCountry,
      this.mailingProvince,
      this.mailingCity,
      this.mailingPincode,
      this.addres,
      this.country,
      this.province,
      this.city,
      this.pincode,
      this.emergencyProvince,
      this.emrgencyName,
      this.emergencyRelation,
      this.emergencyEmail,
      this.emergencyCellPhoneCountryCode,
      this.emergencyCellPhone,
      this.emergencyBusinessPhoneCountryCode,
      this.emergencyBusinessPhone});

  GenInfo.fromJson(Map<String, dynamic> json) {
    agentId = json['AgentId'];
    salution = json['Salution'];
    gender = json['Gender'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    maritialStatus = json['MaritialStatus'];
    dateOfBirth = json['DateOfBirth'];
    language = json['Language'];
    email = json['Email'];
    mobileNoCountryCode = json['MobileNoCountryCode'];
    mobileNo = json['MobileNo'];
    citizenship = json['Citizenship'];
    passportNo = json['PassportNo'];
    passportExpiryDate = json['PassportExpiryDate'];
    mailingAddressSame = json['MailingAddressSame'];
    mailingAddres = json['MailingAddres'];
    mailingCountry = json['MailingCountry'];
    mailingProvince = json['MailingProvince'];
    mailingCity = json['MailingCity'];
    mailingPincode = json['MailingPincode'];
    addres = json['Addres'];
    country = json['Country'];
    province = json['Province'];
    city = json['City'];
    pincode = json['Pincode'];
    emergencyProvince = json['EmergencyProvince'];
    emrgencyName = json['EmrgencyName'];
    emergencyRelation = json['EmergencyRelation'];
    emergencyEmail = json['EmergencyEmail'];
    emergencyCellPhoneCountryCode = json['EmergencyCellPhoneCountryCode'];
    emergencyCellPhone = json['EmergencyCellPhone'];
    emergencyBusinessPhoneCountryCode =
        json['EmergencyBusinessPhoneCountryCode'];
    emergencyBusinessPhone = json['EmergencyBusinessPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AgentId'] = this.agentId;
    data['Salution'] = this.salution;
    data['Gender'] = this.gender;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['MaritialStatus'] = this.maritialStatus;
    data['DateOfBirth'] = this.dateOfBirth;
    data['Language'] = this.language;
    data['Email'] = this.email;
    data['MobileNoCountryCode'] = this.mobileNoCountryCode;
    data['MobileNo'] = this.mobileNo;
    data['Citizenship'] = this.citizenship;
    data['PassportNo'] = this.passportNo;
    data['PassportExpiryDate'] = this.passportExpiryDate;
    data['MailingAddressSame'] = this.mailingAddressSame;
    data['MailingAddres'] = this.mailingAddres;
    data['MailingCountry'] = this.mailingCountry;
    data['MailingProvince'] = this.mailingProvince;
    data['MailingCity'] = this.mailingCity;
    data['MailingPincode'] = this.mailingPincode;
    data['Addres'] = this.addres;
    data['Country'] = this.country;
    data['Province'] = this.province;
    data['City'] = this.city;
    data['Pincode'] = this.pincode;
    data['EmergencyProvince'] = this.emergencyProvince;
    data['EmrgencyName'] = this.emrgencyName;
    data['EmergencyRelation'] = this.emergencyRelation;
    data['EmergencyEmail'] = this.emergencyEmail;
    data['EmergencyCellPhoneCountryCode'] = this.emergencyCellPhoneCountryCode;
    data['EmergencyCellPhone'] = this.emergencyCellPhone;
    data['EmergencyBusinessPhoneCountryCode'] =
        this.emergencyBusinessPhoneCountryCode;
    data['EmergencyBusinessPhone'] = this.emergencyBusinessPhone;
    return data;
  }
}

class ProgramInfo {
  int? intekId;

  ProgramInfo({this.intekId = 0});

  ProgramInfo.fromJson(Map<String, dynamic> json) {
    intekId = json['IntekId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IntekId'] = this.intekId;
    return data;
  }
}

class EduInfo {
  int? studentId;
  int? countryOfEducation;
  int? highestLevelOfEducation;
  int? gradingScheme;
  String? gradeAverage;
  int? graduatedMostRecent;
  String? eduYearEnd;
  String? eduYearStart;

  EduInfo(
      {this.studentId = 0,
      this.countryOfEducation = 0,
      this.highestLevelOfEducation = 0,
      this.gradingScheme = 0,
      this.gradeAverage = '',
      this.graduatedMostRecent = 0,
      this.eduYearEnd = '',
      this.eduYearStart = ''});

  EduInfo.fromJson(Map<String, dynamic> json) {
    studentId = json['StudentId'];
    countryOfEducation = json['CountryOfEducation'];
    highestLevelOfEducation = json['HighestLevelOfEducation'];
    gradingScheme = json['GradingScheme'];
    gradeAverage = json['GradeAverage'];
    graduatedMostRecent = json['GraduatedMostRecent'];
    eduYearEnd = json['EduYearEnd'];
    eduYearStart = json['EduYearStart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudentId'] = this.studentId;
    data['CountryOfEducation'] = this.countryOfEducation;
    data['HighestLevelOfEducation'] = this.highestLevelOfEducation;
    data['GradingScheme'] = this.gradingScheme;
    data['GradeAverage'] = this.gradeAverage;
    data['GraduatedMostRecent'] = this.graduatedMostRecent;
    data['EduYearEnd'] = this.eduYearEnd;
    data['EduYearStart'] = this.eduYearStart;
    return data;
  }
}

class TestScore {
  int? studentId;
  int? englishExamType;
  String? englishExamDate;
  String? englishScoreL;
  String? englishScoreR;
  String? englishScoreW;
  String? englishScoreS;
  String? gREExamDate;
  String? gREScoreV;
  String? gREScoreQ;
  String? gREScoreW;
  String? gMATExamDate;
  String? gMATScoreA;
  String? gMATScoreI;
  String? gMATScoreQ;
  String? gMATScoreV;
  String? englishScoreOverall;

  TestScore({
    this.studentId = 0,
    this.englishExamType = 0,
    this.englishExamDate = '',
    this.englishScoreL = '',
    this.englishScoreR = '',
    this.englishScoreW = '',
    this.englishScoreS = '',
    this.gREExamDate = '',
    this.gREScoreV = '',
    this.gREScoreQ = '',
    this.gREScoreW = '',
    this.gMATExamDate = '',
    this.gMATScoreA = '',
    this.gMATScoreI = '',
    this.gMATScoreQ = '',
    this.gMATScoreV = '',
    this.englishScoreOverall = '',
  });

  TestScore.fromJson(Map<String, dynamic> json) {
    studentId = json['StudentId'];
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
    englishScoreOverall = json['EnglishScoreOverall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudentId'] = this.studentId;
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
    data['EnglishScoreOverall'] = this.englishScoreOverall;
    return data;
  }
}
