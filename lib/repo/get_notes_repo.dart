import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_notes_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetNotesRepo extends ApiURLService {
  static Future<List<GetNotesResponseModel>> getNotesRepo(
      {int? activityId}) async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/Activity/List?ActivityType=1&ActivityId=$activityId",
        apitype: APIType.aGet);

    List<GetNotesResponseModel> getNotesResponseModel =
        getNotesResponseModelFromJson(jsonEncode(response));
    return getNotesResponseModel;
  }
}
