import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_notification_response_model.dart';
import 'package:msm_unify/repo/get_notification_repo.dart';

class GetNotificationViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    getNotificationViewModel();
  }

  Future<void> getNotificationViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      GetNotificationResponseModel response =
          await GetNotificationRepo.getNotificationRepo();
      print('GetNotificationResponseModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
