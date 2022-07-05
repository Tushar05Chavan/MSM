import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/user_assignee_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class UserAssigneeRepo extends ApiURLService {
  Future<List<UserAssigneeResponseModel>> userAssigneeRepo(
      {int? applicationId, int? programId, int? countryId}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/User/DownTeamForDDL",
        apitype: APIType.aPost,
        body: {
          "rolesIn": "",
          "rolesNotIn": "",
          "roleTypeIn": "",
          "roleTypeNotIn": ""
        });
    List<UserAssigneeResponseModel> userAssigneeResponseModel =
        userAssigneeResponseModelFromJson(jsonEncode(response));
    return userAssigneeResponseModel;
  }
}
