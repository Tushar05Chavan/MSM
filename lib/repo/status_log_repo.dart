import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/status_log_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StatusLogRepo extends ApiURLService {
  Future<List<StatusLogResponseModel>> statusLogRepo({int? activityId}) async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/Activity/List?ActivityType=5&ActivityId=$activityId",
        apitype: APIType.aGet);
    List<StatusLogResponseModel> statusLogResponseModel =
        statusLogResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${statusLogResponseModel.first}');
    return statusLogResponseModel;
  }
}
