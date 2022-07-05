// To parse this JSON data, do
//
//     final commissionAdvanceResponseModel = commissionAdvanceResponseModelFromJson(jsonString);

import 'dart:convert';

CommissionAdvanceResponseModel commissionAdvanceResponseModelFromJson(
        String str) =>
    CommissionAdvanceResponseModel.fromJson(json.decode(str));

String commissionAdvanceResponseModelToJson(
        CommissionAdvanceResponseModel data) =>
    json.encode(data.toJson());

class CommissionAdvanceResponseModel {
  CommissionAdvanceResponseModel({
    this.data,
    this.columns,
  });

  List<Datum>? data;
  List<Column>? columns;

  factory CommissionAdvanceResponseModel.fromJson(Map<String, dynamic> json) =>
      CommissionAdvanceResponseModel(
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
  Type? type;
  Format? format;
  bool? isTotal;
  bool? isHtml;

  factory Column.fromJson(Map<String, dynamic> json) => Column(
        columnDef: json["columnDef"],
        header: json["header"],
        type: typeValues.map[json["type"]],
        format: formatValues.map[json["format"]],
        isTotal: json["isTotal"],
        isHtml: json["isHTML"],
      );

  Map<String, dynamic> toJson() => {
        "columnDef": columnDef,
        "header": header,
        "type": typeValues.reverse![type],
        "format": formatValues.reverse![format],
        "isTotal": isTotal,
        "isHTML": isHtml,
      };
}

enum Format { EMPTY, DD_MMM_YYYY }

final formatValues =
    EnumValues({"dd MMM yyyy": Format.DD_MMM_YYYY, "": Format.EMPTY});

enum Type { EMPTY, DATE }

final typeValues = EnumValues({"date": Type.DATE, "": Type.EMPTY});

class Datum {
  Datum({
    this.firstName,
    this.middleName,
    this.lastName,
    this.program,
    this.depositDate,
    this.studentId,
    this.feeDeposit,
    this.commission,
    this.importFeeAmount,
    this.importCommissionAmount,
    this.commissionRemark,
    this.invoiceNumber,
    this.enrollmentRemark,
  });

  String? firstName;
  String? middleName;
  String? lastName;
  String? program;
  DateTime? depositDate;
  String? studentId;
  double? feeDeposit;
  dynamic commission;
  dynamic importFeeAmount;
  dynamic importCommissionAmount;
  dynamic commissionRemark;
  dynamic invoiceNumber;
  String? enrollmentRemark;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        firstName: json["First name"],
        middleName: json["Middle name"],
        lastName: json["Last name"],
        program: json["Program"],
        depositDate: DateTime.parse(json["Deposit date"]),
        studentId: json["Student ID"] == null ? null : json["Student ID"],
        feeDeposit: json["Fee deposit"],
        commission: json["Commission"],
        importFeeAmount: json["Import fee amount"],
        importCommissionAmount: json["Import commission amount"],
        commissionRemark: json["Commission remark"],
        invoiceNumber: json["Invoice number"],
        enrollmentRemark: json["Enrollment remark"],
      );

  Map<String, dynamic> toJson() => {
        "First name": firstName,
        "Middle name": middleName,
        "Last name": lastName,
        "Program": program,
        "Deposit date": depositDate!.toIso8601String(),
        "Student ID": studentId == null ? null : studentId,
        "Fee deposit": feeDeposit,
        "Commission": commission,
        "Import fee amount": importFeeAmount,
        "Import commission amount": importCommissionAmount,
        "Commission remark": commissionRemark,
        "Invoice number": invoiceNumber,
        "Enrollment remark": enrollmentRemark,
      };
}

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
