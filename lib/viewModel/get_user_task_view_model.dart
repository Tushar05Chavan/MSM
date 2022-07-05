import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_user_task_response_model.dart';
import 'package:msm_unify/repo/get_user_task_repo.dart';

class GetUserTaskViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getUserTaskViewModel();
  }

  Future<void> getUserTaskViewModel(
      {int? assignedTo, String? fromDate, String? toDate}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetUserTaskResponseModel> response = await GetUserTaskRepo()
          .getUserTaskRepo(
              assignedTo: assignedTo, fromDate: fromDate, toDate: toDate);
      print('GetUserTaskResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
