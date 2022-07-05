import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/country_for_search_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class CountryForSearchRepo extends ApiURLService {
  Future<List<CountryForSearchProgramResponseModel>>
      countryForSearchRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/CountryForSearchProgram",
        apitype: APIType.aGet);
    List<CountryForSearchProgramResponseModel>
        countryForSearchProgramResponseModel =
        countryForSearchProgramResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${countryForSearchProgramResponseModel.first}');
    return countryForSearchProgramResponseModel;
  }
}
