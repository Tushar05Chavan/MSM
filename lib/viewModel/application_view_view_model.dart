import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/application_view_response_model.dart';
import 'package:msm_unify/repo/application_view_repo.dart';

class ApplicationViewViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   applicationViewViewModel();
  // }

  Future<void> applicationViewViewModel({int? applicationId}) async {
    print('=========$applicationId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ApplicationViewResponseModel response =
          await ApplicationViewRepo.applicationViewRepo(
              applicationId: applicationId);
      print('applicationViewRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
