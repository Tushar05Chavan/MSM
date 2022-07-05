import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/application_view_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ApplicationViewRepo extends ApiURLService {
  static Future<ApplicationViewResponseModel> applicationViewRepo(
      {int? applicationId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Application/View?ApplicationId=$applicationId",
      apitype: APIType.aPost,
    );
    print(
        'url====${'https://msmunifyapicore.azurewebsites.net/Application/View?ApplicationId=$applicationId'}');
    ApplicationViewResponseModel applicationViewResponseModel =
        ApplicationViewResponseModel.fromJson(response);
    return applicationViewResponseModel;
  }
}
