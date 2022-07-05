import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../model/responseModek/report_student_response_model.dart';

class ReportStudentRepo extends ApiURLService {
  static Future<StudentResponseModel> reportStudentRepo() async {
    final body = '{"keyword": ""}';
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Reports/Dynamic/student-analysis",
        apitype: APIType.aPost,
        body: {
          "InstitutionPartnerType": 0,
          "InstitutionId": 0,
          "AgentId": 9701,
          "ApplicationType": 0,
          "Duration": "1"
        });

    print('--responce ${response}');
    StudentResponseModel studentResponseModel =
        studentResponseModelFromJson(jsonEncode(response));
    print('=========errorr');
    return studentResponseModel;
  }
}
