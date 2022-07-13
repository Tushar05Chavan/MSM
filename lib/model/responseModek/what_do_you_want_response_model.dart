// To parse this JSON data, do
//
//     final whatDoYouWantResponseModel = whatDoYouWantResponseModelFromJson(jsonString);

import 'dart:convert';

List<WhatDoYouWantResponseModel> whatDoYouWantResponseModelFromJson(String str) => List<WhatDoYouWantResponseModel>.from(json.decode(str).map((x) => WhatDoYouWantResponseModel.fromJson(x)));

String whatDoYouWantResponseModelToJson(List<WhatDoYouWantResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WhatDoYouWantResponseModel {
    WhatDoYouWantResponseModel({
        required this.label,
        required this.data,
    });

    String label;
    List<String> data;

    factory WhatDoYouWantResponseModel.fromJson(Map<String, dynamic> json) => WhatDoYouWantResponseModel(
        label: json["label"],
        data: List<String>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
