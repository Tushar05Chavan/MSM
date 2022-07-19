import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_notes_response_model.dart';
import 'package:msm_unify/model/responseModek/get_student_notes_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetStudentNotesRepo extends ApiURLService {
  static Future<List<GetStudentNotesResponseModel>> getStudentNotesRepo(
      {int? activityId}) async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/Activity/List?ActivityType=10&ActivityId=$activityId",
        apitype: APIType.aGet);

    List<GetStudentNotesResponseModel> geStudenttNotesResponseModel =
        getStudentNotesResponseModelFromJson(jsonEncode(response));
    return geStudenttNotesResponseModel;
  }
}
