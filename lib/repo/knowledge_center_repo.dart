import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/knowledge_center_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class KnowledgeCenterRepo extends ApiURLService {
  // Map<String, String> qParams = {
  //   'Duration': '3',
  // };
  Future<List<KnowledgeCenterResponseModel>> knowledgeCenterRepo(
      {String? keyword}) async {
    print('rrfgr');
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/KnowledgeCenter/DisplayList?keyword=$keyword",
        apitype: APIType.aGet);

    List<KnowledgeCenterResponseModel> knowledgeCenterResponseModel =
        knowledgeCenterResponseModelFromJson(jsonEncode(response));
    return knowledgeCenterResponseModel;
  }
}
