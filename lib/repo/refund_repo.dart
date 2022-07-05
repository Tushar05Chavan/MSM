import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/refund_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class RefundRepo extends ApiURLService {
  static Future<List<RefundResponseModel>> refundRepo() async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/refund/List",
      apitype: APIType.aPost,
      body: {
        "keyword": "All"
      }
    );
    print('------RESPONSE $response');
    List<RefundResponseModel> refundResponseModel =
        refundResponseModelFromJson(jsonEncode(response));
    return refundResponseModel;
  }
}
