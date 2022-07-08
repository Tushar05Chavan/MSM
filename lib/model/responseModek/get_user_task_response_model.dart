// To parse this JSON data, do
//
//     final getUserTaskResponseModel = getUserTaskResponseModelFromJson(jsonString);

import 'dart:convert';

List<GetUserTaskResponseModel> getUserTaskResponseModelFromJson(String str) =>
    List<GetUserTaskResponseModel>.from(
        json.decode(str).map((x) => GetUserTaskResponseModel.fromJson(x)));

String getUserTaskResponseModelToJson(List<GetUserTaskResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    

class GetUserTaskResponseModel {
  GetUserTaskResponseModel({
    this.taskId,
    this.taskSubject,
    this.dueDate,
    this.taskStatus,
    this.taskPriority,
    this.taskDescription,
    this.reminderDate,
    this.isRecurring,
    this.recurringMode,
    this.recurranceStart,
    this.recurranceEnd,
    this.taskOwner,
    this.taskResponse,
    this.assignedTo,
    this.creator,
    this.taskType,
    this.dueHours,
    this.dueMinutes,
    this.taskOwnerName,
    this.assignedToName,
    this.actualHours,
    this.actualMinutes,
    this.taskOwnerEmailId,
    this.assignedToEmailId,
    this.noOfEmail,
    this.taskTypeId,
    this.taskTypeName,
    this.actLabel,
    this.activityDate,
    this.activityCount,
    this.isTaskorSession,
  });

  int? taskId;
  String? taskSubject;
  DateTime? dueDate;
  String? taskStatus;
  String? taskPriority;
  TaskDescription? taskDescription;
  dynamic reminderDate;
  dynamic isRecurring;
  dynamic recurringMode;
  dynamic recurranceStart;
  dynamic recurranceEnd;
  String? taskOwner;
  String? taskResponse;
  AssignedTo? assignedTo;
  dynamic creator;
  dynamic taskType;
  String? dueHours;
  String? dueMinutes;
  dynamic taskOwnerName;
  dynamic assignedToName;
  double? actualHours;
  double? actualMinutes;
  dynamic taskOwnerEmailId;
  dynamic assignedToEmailId;
  dynamic noOfEmail;
  int? taskTypeId;
  String? taskTypeName;
  dynamic actLabel;
  dynamic activityDate;
  int? activityCount;
  int? isTaskorSession;

  factory GetUserTaskResponseModel.fromJson(Map<String, dynamic> json) =>
      GetUserTaskResponseModel(
        taskId: json["TaskId"],
        taskSubject: json["TaskSubject"],
        dueDate: DateTime.parse(json["DueDate"]),
        taskStatus: json["TaskStatus"],
        taskPriority: json["TaskPriority"],
        taskDescription: taskDescriptionValues.map[json["TaskDescription"]],
        reminderDate: json["ReminderDate"],
        isRecurring: json["isRecurring"],
        recurringMode: json["RecurringMode"],
        recurranceStart: json["RecurranceStart"],
        recurranceEnd: json["RecurranceEnd"],
        taskOwner: json["TaskOwner"],
        taskResponse: json["TaskResponse"],
        assignedTo: assignedToValues.map[json["AssignedTo"]],
        creator: json["Creator"],
        taskType: json["TaskType"],
        dueHours: json["DueHours"],
        dueMinutes: json["DueMinutes"],
        taskOwnerName: json["TaskOwnerName"],
        assignedToName: json["AssignedToName"],
        actualHours: json["ActualHours"] == null ? null : json["ActualHours"],
        actualMinutes:
            json["ActualMinutes"] == null ? null : json["ActualMinutes"],
        taskOwnerEmailId: json["TaskOwnerEmailId"],
        assignedToEmailId: json["AssignedToEmailId"],
        noOfEmail: json["NoOfEmail"],
        taskTypeId: json["TaskTypeId"],
        taskTypeName: json["TaskTypeName"],
        actLabel: json["ActLabel"],
        activityDate: json["ActivityDate"],
        activityCount: json["ActivityCount"],
        isTaskorSession: json["IsTaskorSession"],
      );

  Map<String, dynamic> toJson() => {
        "TaskId": taskId,
        "TaskSubject": taskSubject,
        "DueDate": dueDate!.toIso8601String(),
        "TaskStatus": taskStatus,
        "TaskPriority": taskPriorityValues.reverse![taskPriority],
        "TaskDescription": taskDescriptionValues.reverse![taskDescription],
        "ReminderDate": reminderDate,
        "isRecurring": isRecurring,
        "RecurringMode": recurringMode,
        "RecurranceStart": recurranceStart,
        "RecurranceEnd": recurranceEnd,
        "TaskOwner": assignedToValues.reverse![taskOwner],
        "TaskResponse": taskResponse,
        "AssignedTo": assignedToValues.reverse![assignedTo],
        "Creator": creator,
        "TaskType": taskType,
        "DueHours": dueHours,
        "DueMinutes": dueMinutes,
        "TaskOwnerName": taskOwnerName,
        "AssignedToName": assignedToName,
        "ActualHours": actualHours == null ? null : actualHours,
        "ActualMinutes": actualMinutes == null ? null : actualMinutes,
        "TaskOwnerEmailId": taskOwnerEmailId,
        "AssignedToEmailId": assignedToEmailId,
        "NoOfEmail": noOfEmail,
        "TaskTypeId": taskTypeId,
        "TaskTypeName": taskTypeName,
        "ActLabel": actLabel,
        "ActivityDate": activityDate,
        "ActivityCount": activityCount,
        "IsTaskorSession": isTaskorSession,
      };
}

enum AssignedTo { MEGHA }

final assignedToValues = EnumValues({"Megha": AssignedTo.MEGHA});

enum TaskDescription { ASD, JHGFDSA, EMPTY }

final taskDescriptionValues = EnumValues({
  "asd": TaskDescription.ASD,
  "": TaskDescription.EMPTY,
  "jhgfdsa": TaskDescription.JHGFDSA
});

enum TaskPriority { LOW, MEDIUM, HIGH }

final taskPriorityValues = EnumValues({
  "High": TaskPriority.HIGH,
  "Low": TaskPriority.LOW,
  "Medium": TaskPriority.MEDIUM
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
