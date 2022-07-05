import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/form_institution_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class FormInstitutionRepo extends ApiURLService {
  static Future<List<FormInstitutionResponseModel>>
      formInstitutionRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Institute/ForDDL", apitype: APIType.aGet);

    print('--res ${response}');
    List<FormInstitutionResponseModel> formInstitutionResponseModel =
        formInstitutionResponseModelFromJson(jsonEncode(response));
    // print('=========jjjj${tilesResponseModel.first}');
    return formInstitutionResponseModel;
  }
}
