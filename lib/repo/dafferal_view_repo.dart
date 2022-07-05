import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/defferal_view_response_model.dart';

import '../services/api_service.dart';
import '../services/api_url.dart';

class DefferalViewRepo extends ApiURLService {
  static Future<DefferalViewResponseModel> deferalViewRepo(
      {int? applicationId}) async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/Application/ViewV1?ApplicationId=$applicationId",
        apitype: APIType.aGet);

    print(
        'url>>>${"${BaseUrl.baseUrl}/Application/ViewV1?ApplicationId=$applicationId"}');
    print('--res ${response}');
    DefferalViewResponseModel detailResModel =
        defferalViewResponseModelFromJson(jsonEncode(response));
    print('=========repooo${detailResModel.genInfo}');
    return detailResModel;
  }
}
