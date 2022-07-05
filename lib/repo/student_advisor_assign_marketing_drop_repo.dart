import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_advisor_assign_marketing_drop_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class AdvisorMarketingDropRepo extends ApiURLService {
  static Future<List<AdvisorMarketingResponseModel>> marketingDropRepo() async {
    final body = {
      "InstitutionId": 0,
      "ProvinceId": 12,
      "Applicationid": 0,
      "CountryId": 101
    };
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Application/MarketingManagerForApplication",
        apitype: APIType.aPost,
        body: {
          "InstitutionId": 0,
          "ProvinceId": 12,
          "Applicationid": 0,
          "CountryId": 101
        });

    print('--responce ${response}');
    List<AdvisorMarketingResponseModel> marketingResponseModel =
        advisorMarketingResponseModelFromJson(jsonEncode(response));
    print('=========errorr');
    return marketingResponseModel;
  }
}
