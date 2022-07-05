import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/refresh_token_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class RefreshTokenRepo extends ApiURLService {
  static Future<RefreshTokenResponseModel> growthAnalysisAdvanceRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Authentication/RefreshToken",
        apitype: APIType.aPost,
        body: {"ip": "0.0.0.0"});

    RefreshTokenResponseModel refreshTokenResponseModel =
        RefreshTokenResponseModel.fromJson(response);
    return refreshTokenResponseModel;
  }
}
