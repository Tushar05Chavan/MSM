// To parse this JSON data, do
//
//     final countryForSearchProgramResponseModel = countryForSearchProgramResponseModelFromJson(jsonString);

import 'dart:convert';

List<CountryForSearchProgramResponseModel>
    countryForSearchProgramResponseModelFromJson(String str) =>
        List<CountryForSearchProgramResponseModel>.from(json
            .decode(str)
            .map((x) => CountryForSearchProgramResponseModel.fromJson(x)));

String countryForSearchProgramResponseModelToJson(
        List<CountryForSearchProgramResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryForSearchProgramResponseModel {
  CountryForSearchProgramResponseModel({
    this.countryId,
    this.countryName,
  });

  int? countryId;
  String? countryName;

  factory CountryForSearchProgramResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CountryForSearchProgramResponseModel(
        countryId: json["CountryId"],
        countryName: json["CountryName"],
      );

  Map<String, dynamic> toJson() => {
        "CountryId": countryId,
        "CountryName": countryName,
      };
}
