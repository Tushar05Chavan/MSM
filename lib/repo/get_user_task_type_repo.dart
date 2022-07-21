import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_user_task_type_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetUserTaskTypeRepo extends ApiURLService {
  Future<List<GetUserTaskTypeResponseModel>> getUserTaskTypeRepo() async {
    var response;
    String url = "https://unify-qa-api.azurewebsites.net/Task/GetTaskType";
    await APIService()
        .getResponse(url: url, apitype: APIType.aGet)
        .then((value) {
      response = value;
    });
    List<GetUserTaskTypeResponseModel> getUserTaskTypeResponseModel =
        getUserTaskTypeResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${getUserTaskTypeResponseModel.first}');
    return getUserTaskTypeResponseModel;
  }
}
