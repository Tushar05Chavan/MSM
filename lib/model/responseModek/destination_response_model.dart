// To parse this JSON data, do
//
//     final destinationResponseModel = destinationResponseModelFromJson(jsonString);

import 'dart:convert';

List<DestinationResponseModel> destinationResponseModelFromJson(String str) => List<DestinationResponseModel>.from(json.decode(str).map((x) => DestinationResponseModel.fromJson(x)));

String destinationResponseModelToJson(List<DestinationResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DestinationResponseModel {
    DestinationResponseModel({
        required this.label,
        required this.data,
    });

    String label;
    List<Datum> data;

    factory DestinationResponseModel.fromJson(Map<String, dynamic> json) => DestinationResponseModel(
        label: json["label"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.name,
        required this.code,
    });

    String name;
    String code;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
    };
}
