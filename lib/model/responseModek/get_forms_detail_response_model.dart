// To parse this JSON data, do
//
//     final getFormsDetailsResponseModel = getFormsDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

List<GetFormsDetailsResponseModel> getFormsDetailsResponseModelFromJson(
        String str) =>
    List<GetFormsDetailsResponseModel>.from(
        json.decode(str).map((x) => GetFormsDetailsResponseModel.fromJson(x)));

String getFormsDetailsResponseModelToJson(
        List<GetFormsDetailsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFormsDetailsResponseModel {
  GetFormsDetailsResponseModel({
    this.docId,
    this.docTitle,
    this.docDescription,
    this.institutionName,
    this.docPath,
    this.institutionId,
  });

  int? docId;
  String? docTitle;
  String? docDescription;
  String? institutionName;
  String? docPath;
  dynamic institutionId;

  factory GetFormsDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetFormsDetailsResponseModel(
        docId: json["DocId"],
        docTitle: json["DocTitle"],
        docDescription: json["DocDescription"],
        institutionName: json["InstitutionName"],
        docPath: json["DocPath"],
        institutionId: json["InstitutionId"],
      );

  Map<String, dynamic> toJson() => {
        "DocId": docId,
        "DocTitle": docTitle,
        "DocDescription": docDescription,
        "InstitutionName": institutionName,
        "DocPath": docPath,
        "InstitutionId": institutionId,
      };
}
