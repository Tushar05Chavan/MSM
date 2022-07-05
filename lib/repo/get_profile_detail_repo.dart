import 'package:get/get.dart';
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProfileDetailRepo extends ApiURLService {
  static profileDetailRepo(Map<String, dynamic> body) async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/Agent/Get?AgentId=${Get.find<AppData>().loginResponseModel.rslt!.refId}",
        apitype: APIType.aPost,
        body: body);
  }
}
