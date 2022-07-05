import 'package:msm_unify/model/responseModek/conversion_ratio_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../App/common/AppConfig/base_url.dart';

class ConversionRatioRepo extends ApiURLService {
  static Future<ConversionRatioResponseModel> conversionRatioRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Reports/Dynamic/conversion-ratio",
        apitype: APIType.aPost,
        body: {
          "InstitutionPartnerType": 0,
          "InstitutionId": 0,
          "AgentId": 9701,
          "ApplicationType": 0,
          "Duration": "1"
        });

    ConversionRatioResponseModel conversionRatioResponseModel =
        ConversionRatioResponseModel.fromJson(response);
    return conversionRatioResponseModel;
  }
}
