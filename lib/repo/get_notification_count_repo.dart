import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetNotificationCountRepo extends ApiURLService {
  static Future<int> getNotificationCountRepo() async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/UserNotification/Count",
      apitype: APIType.aGet,
    );

    print('hfhsdkjfsdhfkjdshjksdgdgh${response}');

    return response;
  }
}
