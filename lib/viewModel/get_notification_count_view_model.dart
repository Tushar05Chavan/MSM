import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';

import '../App/common/AppConfig/base_url.dart';
import '../services/api_service.dart';

class GetNotificationCountViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  int notification = 0;

  onInit() {
    getNotificationCountViewModel();
  }

  Future<void> getNotificationCountViewModel() async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/UserNotification/Count",
      apitype: APIType.aGet,
    );

    notification = response;

    update();
  }
}
