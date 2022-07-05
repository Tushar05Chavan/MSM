import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/program_mode_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProgramModeRepo extends ApiURLService {
  static Future<List<ProgramModeResponseModel>> programModeRepo(
      {int? programId}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Program/Mode?ProgramId=$programId",
        apitype: APIType.aGet);
    List<ProgramModeResponseModel> programModeResponseModel =
        programModeResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${programModeResponseModel.first}');
    return programModeResponseModel;
  }
}
