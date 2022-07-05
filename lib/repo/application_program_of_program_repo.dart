import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/application_program_of_program_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ApplicationProgramOfProgramRepo extends ApiURLService {
  static Future<List<ApplicationProgramOfProgramResponseModel>>
      applicationProgramOfProgramRepo({int? institutionId}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Program/ForDDL?InstitutionId=$institutionId",
        apitype: APIType.aGet);
    List<ApplicationProgramOfProgramResponseModel>
        applicationProgramOfProgramResponseModel =
        applicationProgramOfProgramResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${applicationProgramOfProgramResponseModel.first}');
    return applicationProgramOfProgramResponseModel;
  }
}
