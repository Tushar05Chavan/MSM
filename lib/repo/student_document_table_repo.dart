import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_document_table_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentDocRepo extends ApiURLService {
  static Future<List<StudentDocumentResponseModel>> studentDocRepo(
      {int? parentId}) async {
    var response = await APIService().getResponse(
      url:
          "${BaseUrl.baseUrl}/StudentDocument/List?ParentId=$parentId&ParentType=6",
      apitype: APIType.aGet,
    );
    print(
        'url====${'${BaseUrl.baseUrl}/StudentDocument/List?ParentId=$parentId&ParentType=6'}');
    List<StudentDocumentResponseModel> studentDocResponseModel =
        studentDocumentResponseModelFromJson(jsonEncode(response));
    print('==========${studentDocResponseModel.first}');
    return studentDocResponseModel;
  }
}
