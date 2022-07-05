import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/counsellor_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class CounsellorRepo extends ApiURLService {
  Future<List<CounsellorResponseModel>> counsellorRepo({int? agentId}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/User/ForDDLByAgent",
        apitype: APIType.aPost,
        body: {"rolesIn": "2", "rolesNotIn": "", "AgentId": agentId});
    List<CounsellorResponseModel> counsellorResponseModel =
        counsellorResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${counsellorResponseModel.first}');
    return counsellorResponseModel;
  }
}
