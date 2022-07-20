import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_user_task_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetUserTaskRepo extends ApiURLService {
  Future<List<GetUserTaskResponseModel>> getUserTaskRepo(
      {int? assignedTo, String? fromDate, String? toDate}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Task/ListByEventsSession",
        apitype: APIType.aPost,
        body: {
          "AssignedTo": assignedTo ?? 81,
          "FromDate": fromDate,
          "ToDate": toDate ?? DateTime.now().toString(),
          "TaskPriority": -1,
          "FilterRoleId": ""
        });
    List<GetUserTaskResponseModel> getUserTaskResponseModel =
        getUserTaskResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${getUserTaskResponseModel.first}');
    return getUserTaskResponseModel;
  }


 static Future<bool> addTaskRepo(
      {required Map<String, dynamic> map}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Task/Add",
        apitype: APIType.aPost,
        body: map);
    print('Resposnse is:${response}');
    return true;
  }
}
