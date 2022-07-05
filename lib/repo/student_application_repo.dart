import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_application_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentApplicationViewRepo extends ApiURLService {
  static Future<List<StudApplicationResponseModel>> studApplicationViewRepo(
      {int? studentId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Application/ListByStudent?StudentId=$studentId",
      apitype: APIType.aGet,
    );
    print('sdhgrtjfd');
    print(
        'url====${'${BaseUrl.baseUrl}/Application/ListByStudent?StudentId=$studentId'}');
    List<StudApplicationResponseModel> studentAppResponseModel =
        studApplicationResponseModelFromJson(jsonEncode(response));
    print('========${studentAppResponseModel.first}');
    return studentAppResponseModel;
  }
}
