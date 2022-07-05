import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/growth_analysis_advance_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GrowthAnalysisAdvanceRepo extends ApiURLService {
  static Future<GrowthAnalysisAdvanceResponseModel>
      growthAnalysisAdvanceRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Reports/Dynamic/growth-analysis",
        apitype: APIType.aPost,
        body: {
          "InstitutionPartnerType": 0,
          "InstitutionId": 0,
          "AgentId": 0,
          "ApplicationType": 0,
          "Duration": "1"
        });

    GrowthAnalysisAdvanceResponseModel growthAnalysisAdvanceResponseModel =
        GrowthAnalysisAdvanceResponseModel.fromJson(response);
    return growthAnalysisAdvanceResponseModel;
  }
}
