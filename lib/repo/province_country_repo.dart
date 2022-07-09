import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/province_country_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProvinceCountryRepo extends ApiURLService {
  Future<List<ProvinceCountryResponseModel>> provinceCountryRepo(
      {int? countryId}) async {
    print('countryId:$countryId');
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/Province?Country=$countryId",
        apitype: APIType.aGet);
    ('rrfgr');
    print('--res ${response}');
    List<ProvinceCountryResponseModel> provinceCountryResponseModel =
        provinceCountryResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${provinceCountryResponseModel.first}');
    return provinceCountryResponseModel;
  }
}
