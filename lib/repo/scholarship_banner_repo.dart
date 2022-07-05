import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/scholarship_banner_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ScholarshipBannerRepo extends ApiURLService {
  Future<List<ScholarshipBannerResponseModel>> scholarshipBannerRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/ScholarShipDisplay/BannerList",
        apitype: APIType.aGet);

    List<ScholarshipBannerResponseModel> scholarshipBannerResponseModel =
        scholarshipBannerResponseModelFromJson(jsonEncode(response));

    return scholarshipBannerResponseModel;
  }
}
