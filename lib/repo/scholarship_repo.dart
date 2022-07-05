import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/scholarship_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ScholarshipRepo extends ApiURLService {
  Future<List<ScholarshipResponseModel>> scholarshipRepo() async {
    print('hiiii');
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/ScholarShip/ForAgentDashboard", apitype: APIType.aGet);
    print('--res ${response}');
    List<ScholarshipResponseModel> scholarshipResponseModel =
        scholarshipResponseModelFromJson(jsonEncode(response));
    print('=========Resssssssss${scholarshipResponseModel.first}');
    return scholarshipResponseModel;
  }
}
