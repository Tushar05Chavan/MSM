import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../model/responseModek/retrieve_application_response_model.dart';

class RetrieveApplicationRepo extends ApiURLService {
  static Future<List<RetrieveAppResponseModel>> retrieveAppRepo() async {
    final body = '{"keyword": ""}';
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Retrieve/Application",
        apitype: APIType.aPost,
        body: {"keyword": ""});

    print('--response ${response}');
    List<RetrieveAppResponseModel> retrieveAppResponseModel =
        retrieveAppResponseModelFromJson(jsonEncode(response));
    print('=========error');
    return retrieveAppResponseModel;
  }
}
