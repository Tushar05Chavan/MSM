import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/level_of_education_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class LevelOfEducationRepo extends ApiURLService {
  static Future<List<LevelOfEducationResponseModel>> levelOfEducationRepo(
      {int? parentId}) async {
    var response = await APIService().getResponse(
      url:
          "${BaseUrl.baseUrl}/StudentSchool/EduLevelForDDLByApplication?ParentType=2&ParentId=$parentId&SchoolId=undefined",
      apitype: APIType.aGet,
    );
    List<LevelOfEducationResponseModel> levelOfEducationResponseModel =
        levelOfEducationResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${levelOfEducationResponseModel.first}');
    return levelOfEducationResponseModel;
  }

  static Future<bool> educationHistoryRepo(
      {required Map<String, dynamic> map}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/StudentSchool/add",
        apitype: APIType.aPost,
        body: map);
    print('Resposnse is:${response}');
    return true;
  }
}
