import 'dart:convert';

import 'package:msm_unify/model/responseModek/grade_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GradeRepo extends ApiURLService {
  Future<List<GradeResponseModel>> gradeRepo() async {
    var response = await APIService().getResponse(
      url:
          "https://unify-qa-api.azurewebsites.net/Misc/GradeSchemesByCountry?CountryId=1",
      apitype: APIType.aGet,
    );
    List<GradeResponseModel> gradeResponseModel =
        gradeResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${gradeResponseModel.first}');
    return gradeResponseModel;
  }
}
