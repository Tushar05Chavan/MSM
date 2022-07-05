import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/document_dropdown_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class DocumentDropRepo extends ApiURLService {
  Future<List<DocumentDropResponseModel>> documentDropRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/Document?ParentType=6",
        apitype: APIType.aGet);
    List<DocumentDropResponseModel> documentResponseModel =
        documentDropResponseModelFromJson(jsonEncode(response));
    print('=========${documentResponseModel.first}');
    return documentResponseModel;
  }
}
