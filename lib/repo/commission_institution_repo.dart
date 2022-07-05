import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/commission_institution_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class CommissionInstitutionRepo extends ApiURLService {
  Future<List<CommissionInstitutionResponseModel>>
      commissionInstitutionRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Institute/ForDDL", apitype: APIType.aGet);

    List<CommissionInstitutionResponseModel>
        commissionInstitutionResponseModel =
        commissionInstitutionResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${commissionInstitutionResponseModel.first}');
    return commissionInstitutionResponseModel;
  }
}
