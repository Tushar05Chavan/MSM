import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/type_dropdown_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class TypeDropRepo extends ApiURLService {
  static Future<List<TypeDropResponseModel>> typeDropRepo(
      {int? countryId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Misc/VisaType?CountryId=$countryId",
      apitype: APIType.aGet,
    );
    print('gngrnrs');
    print('-----Responseeeee ${response}');
    print('url=====${'${BaseUrl.baseUrl}/Misc/VisaType?CountryId=$countryId'}');
    List<TypeDropResponseModel> typeDropResponseModel =
        typeDropResponseModelFromJson(jsonEncode(response));
    print('==============${typeDropResponseModel.first}');
    return typeDropResponseModel;
  }
}
