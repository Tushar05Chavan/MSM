class SearchResultModel {
  num? institutionId;
  String? instName;
  String? instLogoPath;
  String? instCountry;
  String? instProvince;
  String? instCity;
  num? commission;
  num? partnerTypeId;
  String? instTile;
  num? isViaAbcodo;
  num? instCategoryId;
  List<Programs>? programs;

  SearchResultModel(
      {this.institutionId,
      this.instName,
      this.instLogoPath,
      this.instCountry,
      this.instProvince,
      this.instCity,
      this.commission,
      this.partnerTypeId,
      this.instTile,
      this.isViaAbcodo,
      this.instCategoryId,
      this.programs});

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    institutionId = json['InstitutionId'];
    instName = json['InstName'];
    instLogoPath = json['InstLogoPath'];
    instCountry = json['InstCountry'];
    instProvince = json['InstProvince'];
    instCity = json['InstCity'];
    commission = json['Commission'];
    partnerTypeId = json['PartnerTypeId'];
    instTile = json['InstTile'];
    isViaAbcodo = json['isViaAbcodo'];
    instCategoryId = json['InstCategoryId'];
    if (json['programs'] != null) {
      programs = <Programs>[];
      json['programs'].forEach((v) {
        programs!.add(new Programs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InstitutionId'] = this.institutionId;
    data['InstName'] = this.instName;
    data['InstLogoPath'] = this.instLogoPath;
    data['InstCountry'] = this.instCountry;
    data['InstProvince'] = this.instProvince;
    data['InstCity'] = this.instCity;
    data['Commission'] = this.commission;
    data['PartnerTypeId'] = this.partnerTypeId;
    data['InstTile'] = this.instTile;
    data['isViaAbcodo'] = this.isViaAbcodo;
    data['InstCategoryId'] = this.instCategoryId;
    if (this.programs != null) {
      data['programs'] = this.programs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Programs {
  num? programId;
  String? programName;
  String? durationTime;
  num? durationType;
  num? noOfSemester;
  String? offerLetterTAT;
  String? programCurrency;
  String? programLevel;
  String? programLink;
  String? averageProcessingDay;
  String? programStatus;
  dynamic waiverPer;
  dynamic applicationFee;
  dynamic applicationFeeAfterWaiver;
  dynamic scholarShipAmtType;
  dynamic scholarShipMinAmt;
  dynamic scholarShipMaxAmt;
  List<Campus>? campus;
  List<FeeDetail>? feeDetail;
  List<Intakes>? intakes;

  Programs(
      {this.programId,
      this.programName,
      this.durationTime,
      this.durationType,
      this.noOfSemester,
      this.offerLetterTAT,
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
      this.campus,
      this.feeDetail,
      this.intakes});

  Programs.fromJson(Map<String, dynamic> json) {
    programId = json['ProgramId'];
    programName = json['ProgramName'];
    durationTime = json['DurationTime'];
    durationType = json['DurationType'];
    noOfSemester = json['NoOfSemester'];
    offerLetterTAT = json['OfferLetterTAT'];
    programCurrency = json['ProgramCurrency'];
    programLevel = json['ProgramLevel'];
    programLink = json['ProgramLink'];
    averageProcessingDay = json['AverageProcessingDay'];
    programStatus = json['ProgramStatus'];
    waiverPer = json['WaiverPer'];
    applicationFee = json['ApplicationFee'];
    applicationFeeAfterWaiver = json['ApplicationFeeAfterWaiver'];
    scholarShipAmtType = json['ScholarShipAmtType'];
    scholarShipMinAmt = json['ScholarShipMinAmt'];
    scholarShipMaxAmt = json['ScholarShipMaxAmt'];
    if (json['campus'] != null) {
      campus = <Campus>[];
      json['campus'].forEach((v) {
        campus!.add(new Campus.fromJson(v));
      });
    }
    if (json['FeeDetail'] != null) {
      feeDetail = <FeeDetail>[];
      json['FeeDetail'].forEach((v) {
        feeDetail!.add(new FeeDetail.fromJson(v));
      });
    }
    if (json['Intakes'] != null) {
      intakes = <Intakes>[];
      json['Intakes'].forEach((v) {
        intakes!.add(new Intakes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProgramId'] = this.programId;
    data['ProgramName'] = this.programName;
    data['DurationTime'] = this.durationTime;
    data['DurationType'] = this.durationType;
    data['NoOfSemester'] = this.noOfSemester;
    data['OfferLetterTAT'] = this.offerLetterTAT;
    data['ProgramCurrency'] = this.programCurrency;
    data['ProgramLevel'] = this.programLevel;
    data['ProgramLink'] = this.programLink;
    data['AverageProcessingDay'] = this.averageProcessingDay;
    data['ProgramStatus'] = this.programStatus;
    data['WaiverPer'] = this.waiverPer;
    data['ApplicationFee'] = this.applicationFee;
    data['ApplicationFeeAfterWaiver'] = this.applicationFeeAfterWaiver;
    data['ScholarShipAmtType'] = this.scholarShipAmtType;
    data['ScholarShipMinAmt'] = this.scholarShipMinAmt;
    data['ScholarShipMaxAmt'] = this.scholarShipMaxAmt;
    if (this.campus != null) {
      data['campus'] = this.campus!.map((v) => v.toJson()).toList();
    }
    if (this.feeDetail != null) {
      data['FeeDetail'] = this.feeDetail!.map((v) => v.toJson()).toList();
    }
    if (this.intakes != null) {
      data['Intakes'] = this.intakes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Campus {
  String? campusName;
  String? city;
  String? countryName;

  Campus({this.campusName, this.city, this.countryName});

  Campus.fromJson(Map<String, dynamic> json) {
    campusName = json['CampusName'];
    city = json['City'];
    countryName = json['CountryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CampusName'] = this.campusName;
    data['City'] = this.city;
    data['CountryName'] = this.countryName;
    return data;
  }
}

class FeeDetail {
  num? feeId;
  String? feeType;
  String? feeBasis;
  num? feeAmount;
  String? region;
  String? actualFee;

  FeeDetail(
      {this.feeId,
      this.feeType,
      this.feeBasis,
      this.feeAmount,
      this.region,
      this.actualFee});

  FeeDetail.fromJson(Map<String, dynamic> json) {
    feeId = json['FeeId'];
    feeType = json['FeeType'];
    feeBasis = json['FeeBasis'];
    feeAmount = json['FeeAmount'];
    region = json['Region'];
    actualFee = json['ActualFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FeeId'] = this.feeId;
    data['FeeType'] = this.feeType;
    data['FeeBasis'] = this.feeBasis;
    data['FeeAmount'] = this.feeAmount;
    data['Region'] = this.region;
    data['ActualFee'] = this.actualFee;
    return data;
  }
}

class Intakes {
  String? intakeName;
  String? statusName;

  Intakes({this.intakeName, this.statusName});

  Intakes.fromJson(Map<String, dynamic> json) {
    intakeName = json['IntakeName'];
    statusName = json['StatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IntakeName'] = this.intakeName;
    data['StatusName'] = this.statusName;
    return data;
  }
}
