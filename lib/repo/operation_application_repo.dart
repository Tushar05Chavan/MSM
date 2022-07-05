import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../model/responseModek/operation_application_response_model.dart';

class ApplicationTableRepo extends ApiURLService {
  static Future<ApplicationResponseModel> applicationRepo() async {
    final body = '{"keyword":"all"}';
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Application/ListDetailed",
        apitype: APIType.aPost,
        body: {"keyword": "all"});

    //print('--responce ${response}');
    ApplicationResponseModel applicationResponseModel =
        applicationResponseModelFromJson(jsonEncode(response));
    //print('=========errorr');
    return applicationResponseModel;
  }
}
