import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/status_log_response_model.dart';
import 'package:msm_unify/repo/status_log_repo.dart';

class StatusLogViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> statusLogViewModel({int? activityId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<StatusLogResponseModel> response =
          await StatusLogRepo().statusLogRepo(activityId: activityId);
      print('StatusLogResponseModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
