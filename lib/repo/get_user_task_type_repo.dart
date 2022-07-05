import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_user_task_type_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetUserTaskTypeRepo extends ApiURLService {
  Future<List<GetUserTaskTypeResponseModel>> getUserTaskTypeRepo() async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Task/GetTaskType",
      apitype: APIType.aGet,
    );
    List<GetUserTaskTypeResponseModel> getUserTaskTypeResponseModel =
        getUserTaskTypeResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${getUserTaskTypeResponseModel.first}');
    return getUserTaskTypeResponseModel;
  }
}
