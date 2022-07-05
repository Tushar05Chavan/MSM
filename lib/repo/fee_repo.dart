import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/fee_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class FeeRepo extends ApiURLService {
  Future<List<FeeResponseModel>> feeRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/ProgramFee/ForApplication",
        apitype: APIType.aGet);

    print('--res ${response}');
    List<FeeResponseModel> feeResponseModel =
        feeResponseModelFromJson(jsonEncode(response));
    print('=========ressssssss${feeResponseModel.first}');
    return feeResponseModel;
  }
}
