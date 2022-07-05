import 'dart:convert';

import 'package:get/get.dart';
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/profile_branch_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProfileBranchRepo extends ApiURLService {
  static Future<List<BranchResponseModel>> profileBranchRepo(
      {String? agentId}) async {
    var response = await APIService().getResponse(
      url:
          "${BaseUrl.baseUrl}//Branch/List?AgentId=${Get.find<AppData>().loginResponseModel.rslt!.refId}",
      apitype: APIType.aGet,
    );
    print(
        'url>>>>> ${'${BaseUrl.baseUrl}//Branch/List?AgentId=${Get.find<AppData>().loginResponseModel.rslt!.refId}'}');
    List<BranchResponseModel> branchResponseModel =
        branchResponseModelFromJson(jsonEncode(response));
    print('=========resssss${branchResponseModel.first}');
    return branchResponseModel;
  }
}
