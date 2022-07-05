import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/interest_dialogue_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProgramDropRepo extends ApiURLService {
  static Future<List<InstituteDialogueResponseModel>> programDropRepo(
      {int? instituteId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Program/ForDDL?InstitutionId=$instituteId",
      apitype: APIType.aGet,
    );
    print('gngrnrs');
    print('-----Responseeeee ${response}');
    print(
        'url=====${'https://msmunifyapicore.azurewebsites.net/Program/ForDDL?InstitutionId=$instituteId'}');
    List<InstituteDialogueResponseModel> programResponseModel =
        instituteDialogueResponseModelFromJson(jsonEncode(response));
    print('==============${programResponseModel.first}');
    return programResponseModel;
  }
}
