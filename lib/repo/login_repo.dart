import 'package:msm_unify/model/responseModek/login_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class LoginRepo extends ApiURLService {
  static Future<LoginResponseModel> loginRepo(
      {String? userName, String? password}) async {
    var response = await APIService().getResponse(
        url: "https://unify-qa-api.azurewebsites.net/Authentication/Login",
        apitype: APIType.aPost,
        body: {
          'username': userName,
          'Password': password,
          'LoginType': '0',
          'ip': '0.0.0.0',
        });
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(response);
    return loginResponseModel;
  }
}
