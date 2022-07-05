import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/relation_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class RelationRepo extends ApiURLService {
  Future<List<RelationResponseModel>> relationRepo() async {
    print('rrfgr');
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/RelationDDL", apitype: APIType.aGet);
    print('--res ${response}');
    List<RelationResponseModel> relationResponseModel =
        relationResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${relationResponseModel.first}');
    return relationResponseModel;
  }
}
