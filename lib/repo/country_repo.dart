import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class CountryRepo extends ApiURLService {
  Future<List<CountryResponseModel>> countryRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/Country", apitype: APIType.aGet);
    List<CountryResponseModel> countryResponseModel =
        countryResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${countryResponseModel.first}');
    return countryResponseModel;
  }
}
