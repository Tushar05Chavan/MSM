import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';

import '../model/responseModek/defferal_detail_response_model.dart';
import '../services/api_service.dart';
import '../services/api_url.dart';

class DefferalDetailViewRepo extends ApiURLService {
  Future<List<DetailResModel>> deferalDetailRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/DeferralRequest/List?Keyword=All",
        apitype: APIType.aGet);

    print('--res ${response}');
    List<DetailResModel> detailResModel =
        detailResModelFromJson(jsonEncode(response));
    print('=========repooo${detailResModel.first}');
    return detailResModel;
  }
}
