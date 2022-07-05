import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_forms_detail_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetFormsDetailsRepo extends ApiURLService {
  static Future<List<GetFormsDetailsResponseModel>> getFormsDetailsRepo(
      {int? institutionId, String? keyword}) async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/ShareableDocument/ListForDisplayV1?keyword=$keyword&InstitutionId=$institutionId",
        apitype: APIType.aGet);

    print(
        '--URL  ${BaseUrl.baseUrl}/ShareableDocument/ListForDisplayV1?keyword=$keyword&InstitutionId=$institutionId');
    List<GetFormsDetailsResponseModel> getFormsDetailsResponseModel =
        getFormsDetailsResponseModelFromJson(jsonEncode(response));
    // print('=========jjjj${tilesResponseModel.first}');
    return getFormsDetailsResponseModel;
  }
}
