import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/program_campus_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProgramCampusRepo extends ApiURLService {
  static Future<List<ProgramCampusResponseModel>> programCampusRepo({
    int? intakeId,
  }) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/ProgramIntek/CampusList?IntakeId=$intakeId",
      apitype: APIType.aGet,
    );
    print(
        'url==${' "${BaseUrl.baseUrl}/ProgramIntek/CampusList?IntakeId=$intakeId"'}');
    List<ProgramCampusResponseModel> programCampusResponseModel =
        programCampusResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${programCampusResponseModel.first}');
    return programCampusResponseModel;
  }
}
