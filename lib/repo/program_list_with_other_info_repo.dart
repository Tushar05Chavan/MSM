import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/program_list_with_other_info_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProgramListWithOtherInfoRepo extends ApiURLService {
  static Future<List<ProgramListWithOtherInfoResponseModel>>
      programListWithOtherInfoRepo(
          {int? InstitutionId,
          String? ProgramName,
          int? CountryId,
          int? WaiverPer,
          int? PartnerTypeId}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/FeeWaiverDisplay/ProgramListWithOtherInfo",
        apitype: APIType.aPost,
        body: {
          "InstitutionId": InstitutionId,
          "ProgramName": ProgramName,
          "CountryId": CountryId,
          "WaiverPer": WaiverPer,
          "PartnerTypeId": PartnerTypeId,
          "ExceptProgramId": 0,
          "IsProgramLevelWise": false
        });
    List<ProgramListWithOtherInfoResponseModel>
        programListWithOtherInfoResponseModel =
        getProgramListFilterResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${programListWithOtherInfoResponseModel.first}');
    return programListWithOtherInfoResponseModel;
  }
}
