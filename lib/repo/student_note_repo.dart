import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_note_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentNoteRepo extends ApiURLService {
  static Future<List<StudentNoteResponseModel>> studentNoteRepo(
      {int? activityId}) async {
    var response = await APIService().getResponse(
      url:
          "${BaseUrl.baseUrl}/Activity/List?ActivityType=10&ActivityId=$activityId",
      apitype: APIType.aGet,
    );
    print(
        'url====${'${BaseUrl.baseUrl}/Activity/List?ActivityType=10&ActivityId=$activityId'}');
    List<StudentNoteResponseModel> studentNoteResponseModel =
        studentNoteResponseModelFromJson(jsonEncode(response));
    print('==========${studentNoteResponseModel.first}');
    return studentNoteResponseModel;
  }
}
