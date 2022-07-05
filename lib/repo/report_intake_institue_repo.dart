import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../model/responseModek/report_intake_institute_response_model.dart';

class IntakeInstituteRepo extends ApiURLService {
  static Future<IntakeInstituteResponseModel> intakeInstituteRepo() async {
    final body = '{"keyword": ""}';
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/Reports/Dynamic/agentinstitutionintakewisesummary",
        apitype: APIType.aPost,
        body: {
          "InstitutionPartnerType": 0,
          "InstitutionId": 0,
          "AgentId": 9701,
          "ApplicationType": 1,
          "Duration": "1"
        });

    print('--response ${response}');
    IntakeInstituteResponseModel intakeInstituteResponseModel =
        intakeInstituteResponseModelFromJson(jsonEncode(response));
    print('=========errorrrrrrrr');
    return intakeInstituteResponseModel;
  }
}
