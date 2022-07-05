import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../model/responseModek/country_dropdown_response_model.dart';

class CountryDropRepo extends ApiURLService {
  Future<List<CountryDropResponseModel>> countryDropRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/CountryForSearchProgram",
        apitype: APIType.aGet);
    List<CountryDropResponseModel> countryDropResponseModel =
        countryDropResponseModelFromJson(jsonEncode(response));
    // print('=====COUNTRY DATA=====${countryDropResponseModel.first}');
    return countryDropResponseModel;
  }
}
