// To parse this JSON data, do
//
//     final getUserTaskTypeResponseModel = getUserTaskTypeResponseModelFromJson(jsonString);

import 'dart:convert';

List<GetUserTaskTypeResponseModel> getUserTaskTypeResponseModelFromJson(
        String str) =>
    List<GetUserTaskTypeResponseModel>.from(
        json.decode(str).map((x) => GetUserTaskTypeResponseModel.fromJson(x)));

String getUserTaskTypeResponseModelToJson(
        List<GetUserTaskTypeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUserTaskTypeResponseModel {
  GetUserTaskTypeResponseModel({
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

  dynamic taskId;
  dynamic taskSubject;
  dynamic dueDate;
  dynamic taskStatus;
  dynamic taskPriority;
  dynamic taskDescription;
  dynamic reminderDate;
  dynamic isRecurring;
  dynamic recurringMode;
  dynamic recurranceStart;
  dynamic recurranceEnd;
  dynamic taskOwner;
  dynamic taskResponse;
  dynamic assignedTo;
  dynamic creator;
  dynamic taskType;
  dynamic dueHours;
  dynamic dueMinutes;
  dynamic taskOwnerName;
  dynamic assignedToName;
  dynamic actualHours;
  dynamic actualMinutes;
  dynamic taskOwnerEmailId;
  dynamic assignedToEmailId;
  dynamic noOfEmail;
  int? taskTypeId;
  String? taskTypeName;
  String? actLabel;
  dynamic activityDate;
  dynamic activityCount;
  dynamic isTaskorSession;

  factory GetUserTaskTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      GetUserTaskTypeResponseModel(
        taskId: json["TaskId"],
        taskSubject: json["TaskSubject"],
        dueDate: json["DueDate"],
        taskStatus: json["TaskStatus"],
        taskPriority: json["TaskPriority"],
        taskDescription: json["TaskDescription"],
        reminderDate: json["ReminderDate"],
        isRecurring: json["isRecurring"],
        recurringMode: json["RecurringMode"],
        recurranceStart: json["RecurranceStart"],
        recurranceEnd: json["RecurranceEnd"],
        taskOwner: json["TaskOwner"],
        taskResponse: json["TaskResponse"],
        assignedTo: json["AssignedTo"],
        creator: json["Creator"],
        taskType: json["TaskType"],
        dueHours: json["DueHours"],
        dueMinutes: json["DueMinutes"],
        taskOwnerName: json["TaskOwnerName"],
        assignedToName: json["AssignedToName"],
        actualHours: json["ActualHours"],
        actualMinutes: json["ActualMinutes"],
        taskOwnerEmailId: json["TaskOwnerEmailId"],
        assignedToEmailId: json["AssignedToEmailId"],
        noOfEmail: json["NoOfEmail"],
        taskTypeId: json["TaskTypeId"],
        taskTypeName: json["TaskTypeName"],
        actLabel: json["ActLabel"] == null ? null : json["ActLabel"],
        activityDate: json["ActivityDate"],
        activityCount: json["ActivityCount"],
        isTaskorSession: json["IsTaskorSession"],
      );

  Map<String, dynamic> toJson() => {
        "TaskId": taskId,
        "TaskSubject": taskSubject,
        "DueDate": dueDate,
        "TaskStatus": taskStatus,
        "TaskPriority": taskPriority,
        "TaskDescription": taskDescription,
        "ReminderDate": reminderDate,
        "isRecurring": isRecurring,
        "RecurringMode": recurringMode,
        "RecurranceStart": recurranceStart,
        "RecurranceEnd": recurranceEnd,
        "TaskOwner": taskOwner,
        "TaskResponse": taskResponse,
        "AssignedTo": assignedTo,
        "Creator": creator,
        "TaskType": taskType,
        "DueHours": dueHours,
        "DueMinutes": dueMinutes,
        "TaskOwnerName": taskOwnerName,
        "AssignedToName": assignedToName,
        "ActualHours": actualHours,
        "ActualMinutes": actualMinutes,
        "TaskOwnerEmailId": taskOwnerEmailId,
        "AssignedToEmailId": assignedToEmailId,
        "NoOfEmail": noOfEmail,
        "TaskTypeId": taskTypeId,
        "TaskTypeName": taskTypeName,
        "ActLabel": actLabel == null ? null : actLabel,
        "ActivityDate": activityDate,
        "ActivityCount": activityCount,
        "IsTaskorSession": isTaskorSession,
      };
}
