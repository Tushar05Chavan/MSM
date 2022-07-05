import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/refund_document_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class RefundDocumentRepo extends ApiURLService {
  static Future<List<RefundDocumentResponseModel>> refundDocumentRepo(
      {int? applicationId}) async {
    var response = await APIService().getResponse(
      url:
          "${BaseUrl.baseUrl}/StudentDocument/List?ParentId=$applicationId&ParentType=16",
      apitype: APIType.aGet,
    );
    print(
        'url>>>>> ${'${BaseUrl.baseUrl}/StudentDocument/List?ParentId=$applicationId&ParentType=16'}');
    List<RefundDocumentResponseModel> refundDocumentResponseModel =
        refundDocumentResponseModelFromJson(jsonEncode(response));
    print('=========resssss${refundDocumentResponseModel.first}');
    return refundDocumentResponseModel;
  }
}
