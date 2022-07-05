import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_education_province_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class EducationProvinceRepo extends ApiURLService {
  static Future<List<EducationProvinceResponseModel>> educationProvinceRepo(
      {int? countryId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Misc/Province?Country= $countryId",
      apitype: APIType.aGet,
    );
    print('gngrnrs');
    print('-----Responseeeee ${response}');
    print(
        'url=====${'https://msmunifyapicore.azurewebsites.net/Misc/Province?Country= $countryId'}');
    List<EducationProvinceResponseModel> educationProvinceResponseModel =
        educationProvinceResponseModelFromJson(jsonEncode(response));
    print('==============${educationProvinceResponseModel.first}');
    return educationProvinceResponseModel;
  }
}
