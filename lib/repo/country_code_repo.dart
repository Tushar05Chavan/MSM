import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/country_code_relation_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class CountryCodeRepo extends ApiURLService {
  Future<List<CountryCodeResponseModel>> countryCodeRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/CountryCodeDDL", apitype: APIType.aGet);

    print('--res ${response}');
    List<CountryCodeResponseModel> countryCodeResponseModel =
        countryCodeResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${countryCodeResponseModel.first}');
    return countryCodeResponseModel;
  }
}
