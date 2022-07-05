import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_tiles_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetTilesDetailsRepo extends ApiURLService {
  // Map<String, String> qParams = {
  //   'Duration': '3',
  // };
  Future<List<TilesResponseModel>> getTilesDetails({int? duration}) async {
    print('rrfgr');
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Dashboard/TilesForAgent?Duration=$duration",
        apitype: APIType.aGet);
    List<TilesResponseModel> tilesResponseModel =
        tilesResponseModelFromJson(jsonEncode(response));
    return tilesResponseModel;
  }
}
