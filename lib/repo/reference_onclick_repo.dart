import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/reference_onclick_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ReferenceOnclickRepo extends ApiURLService {
  static Future<ReferOnclickResponseModel> referenceOnclickRepo(
      {int? refId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/AgentRef/Get?RefId=$refId",
      apitype: APIType.aGet,
    );
    print('url>>>>> ${'${BaseUrl.baseUrl}/AgentRef/Get?RefId=$refId'}');
    ReferOnclickResponseModel referOnclickResponseModel =
        referOnclickResponseModelFromJson(jsonEncode(response));
    print('=========resssss$referOnclickResponseModel');
    return referOnclickResponseModel;
  }
}
