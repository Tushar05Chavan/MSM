import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_visa_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentVisaRepo extends ApiURLService {
  static Future<List<StudentVisaResponseModel>> studentVisaRepo(
      {int? studentId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/StudentVisa/List?StudentId=$studentId",
      apitype: APIType.aGet,
    );
    print('sdhgrtjfd');
    
    List<StudentVisaResponseModel> studentVisaResponseModel =
        studentVisaResponseModelFromJson(jsonEncode(response));
    print('========${studentVisaResponseModel.first}');
    return studentVisaResponseModel;
  }
}