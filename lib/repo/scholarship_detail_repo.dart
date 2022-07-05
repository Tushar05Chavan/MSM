import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/scholarship_detail_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ScholarshipDetailRepo extends ApiURLService {
  static Future<List<ScholarshipdetailResponseModel>> scholarshipDetailRepo({
    int? instituteId,
    String? program,
    int? countryId,
    double? minAmt,
    double? maxAmt,
    int? type,
  }) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/ScholarShipDisplay/ProgramListWithOtherInfo",
        apitype: APIType.aPost,
        body: {
          "InstitutionId": instituteId,
          "ProgramName": program,
          "CountryId": countryId,
          "AmtType": null,
          "MinAmt": minAmt,
          "MaxAmt": maxAmt,
          "PartnerTypeId": type,
          "ExceptProgramId": 0,
          "IsProgramLevelWise": false
        });

    print('--responce ${response}');
    List<ScholarshipdetailResponseModel> scholarshipDetailResonseModel =
        scholarshipdetailResponseModelFromJson(jsonEncode(response));
    print('=========errorr');
    return scholarshipDetailResonseModel;
  }
}
