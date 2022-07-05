import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_document_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentDocumentRepo extends ApiURLService {
  Future<List<GetStudentDocumentResponseModel>> studentDocumentRepo(
      {int? applicationId, int? programId, int? countryId}) async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/ProgramDocument/ListForApplication?ApplicationId=$applicationId&ProgramId=$programId&CountryId=$countryId",
        apitype: APIType.aGet);
    List<GetStudentDocumentResponseModel> studentDocumentResponseModel =
        studentDocumentResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${studentDocumentResponseModel.first}');
    return studentDocumentResponseModel;
  }
}
