import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/recent_applications_new_enhance_response_model.dart';
import 'package:msm_unify/repo/recent_application_new_enhance_repo.dart';

class RecentApplicationsNewEnhanceViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    recentApplicationsNewEnhanceViewModel();
  }

  Future<void> recentApplicationsNewEnhanceViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<RecentApplicationsNewEnhanceResponseModel> response =
          await RecentApplicationNewEnhanceRepo
              .recentApplicationNewEnhanceRepo();
      print('RecentApplicationsNewEnhanceResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
