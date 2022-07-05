import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ForgotPasswordRepo extends ApiURLService {
  static forgotPasswordRepo({String? username}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/User/ForgotPassword",
      apitype: APIType.aPost,
      body: {
        "UserName": username,
      },
    );
  }
}
