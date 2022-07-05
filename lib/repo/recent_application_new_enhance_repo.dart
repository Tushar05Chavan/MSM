import 'dart:convert';
import 'package:msm_unify/model/responseModek/new_program_arrivals_enhance_response_model.dart';
import 'package:msm_unify/model/responseModek/news_response_model.dart';
import 'package:msm_unify/model/responseModek/recent_applications_new_enhance_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class RecentApplicationNewEnhanceRepo extends ApiURLService {
  static Future<List<RecentApplicationsNewEnhanceResponseModel>>
      recentApplicationNewEnhanceRepo() async {
    var response = await APIService().getResponse(
        url:
            "https://unify-qa-api.azurewebsites.net/Dashboard/RecentApplicationsNewEnhance",
        apitype: APIType.aGet);

    print('--res ${response}');
    List<RecentApplicationsNewEnhanceResponseModel>
        recentApplicationsNewEnhanceResponseModel =
        recentApplicationsNewEnhanceResponseModelFromJson(jsonEncode(response));
    // print('=========jjjj${tilesResponseModel.first}');
    return recentApplicationsNewEnhanceResponseModel;
  }
}
