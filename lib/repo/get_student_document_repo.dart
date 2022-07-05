import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_document_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetStudentDocumentRepo extends ApiURLService {
  static Future<List<GetStudentDocumentResponseModel>>
      getStudentDocumentRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/Document?ParentType=7",
        apitype: APIType.aGet);
    List<GetStudentDocumentResponseModel> studentDocumentResponseModel =
        studentDocumentResponseModelFromJson(jsonEncode(response));
    // print(
    //     '===== INSTITUTION DATA =====${intakeInstituteDropResponseModel.first}');
    return studentDocumentResponseModel;
  }
}
