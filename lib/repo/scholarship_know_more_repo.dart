import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/scholarship_know_more_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ScholarshipKnowMoreRepo extends ApiURLService {
  static Future<ScholarshipKnowMoreResponseModel> scholarshipKnowMoreRepo(
      {int? programId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Program/ForProgramPage?ProgramId=$programId",
      apitype: APIType.aGet,
    );
    ScholarshipKnowMoreResponseModel scholarshipKnowMoreResponseModel =
        scholarshipKnowMoreResponseModelFromJson(jsonEncode(response));
    print('=========resssss${scholarshipKnowMoreResponseModel.programId}');
    return scholarshipKnowMoreResponseModel;
  }
}
