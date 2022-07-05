import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_notification_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetNotificationRepo extends ApiURLService {
  static Future<GetNotificationResponseModel> getNotificationRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/UserNotification/List", apitype: APIType.aGet);

    GetNotificationResponseModel getNotificationResponseModel =
        GetNotificationResponseModel.fromJson(response);
    return getNotificationResponseModel;
  }
}
 