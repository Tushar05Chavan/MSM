import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/language_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class LanguageRepo extends ApiURLService {
  Future<List<LanguageResponseModel>> languageRepo() async {
    print('rrfgr');
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/Language", apitype: APIType.aGet);
    print('--res ${response}');
    List<LanguageResponseModel> languageResponseModel =
        languageResponseModelFromJson(jsonEncode(response));
    return languageResponseModel;
  }
}
