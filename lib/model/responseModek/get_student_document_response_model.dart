// To parse this JSON data, do
//
//     final stuDocumentResponseModel = stuDocumentResponseModelFromJson(jsonString);

import 'dart:convert';

List<StuDocumentResponseModel> stuDocumentResponseModelFromJson(String str) =>
    List<StuDocumentResponseModel>.from(
        json.decode(str).map((x) => StuDocumentResponseModel.fromJson(x)));

String stuDocumentResponseModelToJson(List<StuDocumentResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StuDocumentResponseModel {
  StuDocumentResponseModel({
    this.documentTypeId,
    this.documentName,
    this.required,
    this.sizelimit,
    this.acceptformat,
  });

  int? documentTypeId;
  String? documentName;
  bool? required;
  int? sizelimit;
  Acceptformat? acceptformat;

  factory StuDocumentResponseModel.fromJson(Map<String, dynamic> json) =>
      StuDocumentResponseModel(
        documentTypeId: json["DocumentTypeId"],
        documentName: json["DocumentName"],
        required: json["required"],
        sizelimit: json["sizelimit"],
        acceptformat: acceptformatValues.map[json["acceptformat"]],
      );

  Map<String, dynamic> toJson() => {
        "DocumentTypeId": documentTypeId,
        "DocumentName": documentName,
        "required": required,
        "sizelimit": sizelimit,
        "acceptformat": acceptformatValues.reverse![acceptformat],
      };
}

enum Acceptformat { EMPTY }

final acceptformatValues = EnumValues({"*/*": Acceptformat.EMPTY});

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
