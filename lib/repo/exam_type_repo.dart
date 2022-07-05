import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/exam_type_response_model.dart';
import 'package:msm_unify/services/api_service.dart';

import '../services/api_url.dart';

class ExamTypeViewRepo extends ApiURLService {
  Future<List<ExamTypeResponseModel>> examTypeViewRepo() async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/ProgramRequirement/RequirementList?ReqTypeId=1",
        apitype: APIType.aGet);
    print('--res ${response}');
    List<ExamTypeResponseModel> examTypeResponseModel =
        examTypeResponseModelFromJson(jsonEncode(response));
    return examTypeResponseModel;
  }
}
