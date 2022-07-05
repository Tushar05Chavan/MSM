import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/for_dashboard_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ForDashboardRepo extends ApiURLService {
  Future<List<ForDashboardResponseModel>> forDashboardRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/FeeWaiver//ForDashboard",
        apitype: APIType.aGet);

    print('--res ${response}');
    List<ForDashboardResponseModel> forDashboardResponseModel =
        forDashboardResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${forDashboardResponseModel.first}');
    return forDashboardResponseModel;
  }
}
