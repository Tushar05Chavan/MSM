import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_user_task_type_response_model.dart';
import 'package:msm_unify/repo/get_user_task_type_repo.dart';

class GetUserTaskTypeViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getUserTaskTypeViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetUserTaskTypeResponseModel> response =
          await GetUserTaskTypeRepo().getUserTaskTypeRepo();
      print('GetUserTaskTypeResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
