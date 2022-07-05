import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/receipt_type_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ReceiptTypeRepo extends ApiURLService {
  Future<List<ReceiptTypeResponseModel>> receiptTypeRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/ReceiptTypes", apitype: APIType.aGet);

    print('--res ${response}');
    List<ReceiptTypeResponseModel> receiptTypeResponseModel =
        receiptTypeResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${receiptTypeResponseModel.first}');
    return receiptTypeResponseModel;
  }
}
