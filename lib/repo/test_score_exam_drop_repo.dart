import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../model/responseModek/test_score_exam_drop_response_model.dart';

class TestScoreExamDropdownRepo extends ApiURLService {
  Future<List<ExamDropResponseModel>> testScoreExamDropdownRepo() async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/ProgramRequirement/RequirementList?ReqTypeId=1",
        apitype: APIType.aGet);
    List<ExamDropResponseModel> examDropResponseModel =
        examDropResponseModelFromJson(jsonEncode(response));
    print('=============${examDropResponseModel.first}');
    return examDropResponseModel;
  }
}
