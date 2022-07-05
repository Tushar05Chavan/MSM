// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.error,
    this.token,
    this.menu,
    this.rslt,
  });

  dynamic error;
  String? token;
  List<dynamic>? menu;
  Rslt? rslt;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        error: json["error"],
        token: json["token"],
        menu: List<dynamic>.from(json["menu"].map((x) => x)),
        rslt: Rslt.fromJson(json["rslt"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "token": token,
        "menu": List<dynamic>.from(menu!.map((x) => x)),
        "rslt": rslt!.toJson(),
      };
}

class Rslt {
  Rslt({
    this.userId,
    this.displayName,
    this.userName,
    this.mobileNo,
    this.emailId,
    this.isActive,
    this.roleId,
    this.roleType,
    this.profileImage,
    this.refId,
    this.isDefault,
    this.isEmailVerified,
    this.accountVerificationStatus,
    this.isPrimary,
    this.providerName,
    this.providerId,
    this.permission,
    this.institutionCount,
    this.businessCertFound,
    this.partnerTypeId,
    this.isViewCtStatus,
    this.isProfileComplete,
    this.country,
    this.abcodoAgreementComplete,
    this.userSessionId,
  });

  int? userId;
  String? displayName;
  String? userName;
  String? mobileNo;
  String? emailId;
  int? isActive;
  int? roleId;
  int? roleType;
  String? profileImage;
  int? refId;
  int? isDefault;
  int? isEmailVerified;
  int? accountVerificationStatus;
  int? isPrimary;
  String? providerName;
  String? providerId;
  List<Permission>? permission;
  int? institutionCount;
  int? businessCertFound;
  int? partnerTypeId;
  bool? isViewCtStatus;
  int? isProfileComplete;
  String? country;
  int? abcodoAgreementComplete;
  dynamic userSessionId;

  factory Rslt.fromJson(Map<String, dynamic> json) => Rslt(
        userId: json["UserId"],
        displayName: json["DisplayName"],
        userName: json["UserName"],
        mobileNo: json["MobileNo"],
        emailId: json["EmailId"],
        isActive: json["isActive"],
        roleId: json["RoleId"],
        roleType: json["RoleType"],
        profileImage: json["ProfileImage"],
        refId: json["RefId"],
        isDefault: json["isDefault"],
        isEmailVerified: json["isEmailVerified"],
        accountVerificationStatus: json["AccountVerificationStatus"],
        isPrimary: json["isPrimary"],
        providerName: json["ProviderName"],
        providerId: json["ProviderId"],
        permission: List<Permission>.from(
            json["Permission"].map((x) => Permission.fromJson(x))),
        institutionCount: json["InstitutionCount"],
        businessCertFound: json["BusinessCertFound"],
        partnerTypeId: json["PartnerTypeId"],
        isViewCtStatus: json["IsViewCTStatus"],
        isProfileComplete: json["isProfileComplete"],
        country: json["Country"],
        abcodoAgreementComplete: json["AbcodoAgreementComplete"],
        userSessionId: json["UserSessionId"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "DisplayName": displayName,
        "UserName": userName,
        "MobileNo": mobileNo,
        "EmailId": emailId,
        "isActive": isActive,
        "RoleId": roleId,
        "RoleType": roleType,
        "ProfileImage": profileImage,
        "RefId": refId,
        "isDefault": isDefault,
        "isEmailVerified": isEmailVerified,
        "AccountVerificationStatus": accountVerificationStatus,
        "isPrimary": isPrimary,
        "ProviderName": providerName,
        "ProviderId": providerId,
        "Permission": List<dynamic>.from(permission!.map((x) => x.toJson())),
        "InstitutionCount": institutionCount,
        "BusinessCertFound": businessCertFound,
        "PartnerTypeId": partnerTypeId,
        "IsViewCTStatus": isViewCtStatus,
        "isProfileComplete": isProfileComplete,
        "Country": country,
        "AbcodoAgreementComplete": abcodoAgreementComplete,
        "UserSessionId": userSessionId,
      };
}

class Permission {
  Permission({
    this.entityId,
    this.permission,
  });

  int? entityId;
  int? permission;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        entityId: json["EntityId"],
        permission: json["Permission"],
      );

  Map<String, dynamic> toJson() => {
        "EntityId": entityId,
        "Permission": permission,
      };
}
