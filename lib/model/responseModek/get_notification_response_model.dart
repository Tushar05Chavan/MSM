// To parse this JSON data, do
//
//     final getNotificationResponseModel = getNotificationResponseModelFromJson(jsonString);

import 'dart:convert';

GetNotificationResponseModel getNotificationResponseModelFromJson(String str) =>
    GetNotificationResponseModel.fromJson(json.decode(str));

String getNotificationResponseModelToJson(GetNotificationResponseModel data) =>
    json.encode(data.toJson());

class GetNotificationResponseModel {
  GetNotificationResponseModel({ 
    this.data,
    this.columns,
  });

  List<Datum>? data;
  List<Column>? columns;

  factory GetNotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      GetNotificationResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        columns:
            List<Column>.from(json["columns"].map((x) => Column.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "columns": List<dynamic>.from(columns!.map((x) => x.toJson())),
      };
}

class Column {
  Column({
    this.columnDef,
    this.header,
    this.type,
    this.format,
    this.isTotal,
    this.isHtml,
  });

  String? columnDef;
  String? header;
  String? type;
  String? format;
  bool? isTotal;
  bool? isHtml;

  factory Column.fromJson(Map<String, dynamic> json) => Column(
        columnDef: json["columnDef"],
        header: json["header"],
        type: json["type"],
        format: json["format"],
        isTotal: json["isTotal"],
        isHtml: json["isHTML"],
      );

  Map<String, dynamic> toJson() => {
        "columnDef": columnDef,
        "header": header,
        "type": type,
        "format": format,
        "isTotal": isTotal,
        "isHTML": isHtml,
      };
}

class Datum {
  Datum({
    this.notificationType,
    this.agentStudentName,
    this.queryDetails,
    this.addStamp,
    this.loggedBy,
    this.url,
    this.readFlag,
    this.transactionId,
  });

  String ? notificationType;
  String? agentStudentName;
  String? queryDetails;
  DateTime? addStamp;
  String? loggedBy;
  String? url;
  int? readFlag;
  int? transactionId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        notificationType: json["Notification Type"],
        agentStudentName: json["Agent/Student Name"],
        queryDetails: json["Query Details"],
        addStamp: DateTime.parse(json["Add Stamp"]),
        loggedBy: json["Logged By"] == null ? null : json["Logged By"],
        url: json["Url"],
        readFlag: json["ReadFlag"],
        transactionId: json["TransactionId"],
      );

  Map<String, dynamic> toJson() => {
        "Notification Type": notificationTypeValues.reverse![notificationType],
        "Agent/Student Name": agentStudentName,
        "Query Details": queryDetails,
        "Add Stamp": addStamp!.toIso8601String(),
        "Logged By": loggedBy == null ? null : loggedBy,
        "Url": url,
        "ReadFlag": readFlag,
        "TransactionId": transactionId,
      };
}

enum NotificationType { APPLICATION, STUDENT, AGENT }

final notificationTypeValues = EnumValues({
  "Agent": NotificationType.AGENT,
  "Application": NotificationType.APPLICATION,
  "Student": NotificationType.STUDENT
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
