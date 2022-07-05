import 'dart:convert';

import 'package:get/get.dart';
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/profile_reference_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProfileReferenceRepo extends ApiURLService {
  static Future<List<ReferenceResponseModel>> profileReferenceRepo(
      {String? agentId}) async {
    var response = await APIService().getResponse(
      url:
          "${BaseUrl.baseUrl}/AgentRef/List?AgentId=${Get.find<AppData>().loginResponseModel.rslt!.refId}",
      apitype: APIType.aGet,
    );
    print(
        'url>>>>> ${'${BaseUrl.baseUrl}/AgentRef/List?AgentId=${Get.find<AppData>().loginResponseModel.rslt!.refId}'}');
    List<ReferenceResponseModel> referenceResponseModel =
        referenceResponseModelFromJson(jsonEncode(response));
    print('=========resssss${referenceResponseModel.first}');
    return referenceResponseModel;
  }
}
