import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/scholarship_more_detail_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ScholarshipMoreDetailRepo extends ApiURLService {
  static  Future<List<ScholarshipMoreDetailResponseModel>>scholarshipMoreDetailRepo({int? instituteId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/ScholarShipDisplay/ProgramListWithOtherInfo",
      apitype: APIType.aPost,
      body: {
        "InstitutionId": instituteId,
        "ProgramName": "",
        "CountryId": 0,
        "WaiverPer": 0,
        "PartnerTypeId": 0,
        "ExceptProgramId": "33230",
        "IsProgramLevelWise": true
      },
    );
    print('------responceccc ${response}');
    List<ScholarshipMoreDetailResponseModel>
        scholarshipMoreDetailResponseModel =
        scholarshipMoreDetailResponseModelFromJson(jsonEncode(response));
    print('=========errorr');
    return scholarshipMoreDetailResponseModel;
  }
}
