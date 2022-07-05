import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';

import '../model/responseModek/commission_response_model.dart';
import '../services/api_service.dart';
import '../services/api_url.dart';

class CommissionRepo extends ApiURLService {
  Future<List<CommissionResponseModel>> commissionRepo({int? agentId}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/AgentCommission/List?AgentId=$agentId",
        apitype: APIType.aGet);

    //print('--response ${response}');
    // print(
    //     'URL=====>>>>>${BaseUrl.baseUrl}/AgentCommission/List?AgentId=$agentId');
    List<CommissionResponseModel> commissionResModel =
        commissionResponseModelFromJson(jsonEncode(response));
    print('=========repooo${commissionResModel.first}');
    return commissionResModel;
  }
}
