import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/scholarship_dropdown_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ScholarshipDropRepo extends ApiURLService {
  Future<ScholarshipDropResponseModel> scholarshipDropRepo() async {
    print('hiiii');
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/ScholarShipDisplay/GetProgramListFilter",
        apitype: APIType.aGet);
    print('--res ${response}');
    ScholarshipDropResponseModel scholarshipDropResponseModel =
        scholarshipDropResponseModelFromJson(jsonEncode(response));
    // print('=========Resssssssss${scholarshipDropResponseModel.institution}');
    return scholarshipDropResponseModel;
  }
}
