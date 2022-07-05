import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/scholarship_banner_repo.dart';

import '../model/responseModek/scholarship_banner_response_model.dart';

class ScholarshipBannerViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    scholarshipBannerViewModel();
  }

  Future<void> scholarshipBannerViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ScholarshipBannerResponseModel> response =
          await ScholarshipBannerRepo().scholarshipBannerRepo();
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  int selectedPage = 0;
  void setSelectedPage(int value) {
    selectedPage = value;
    update();
  }
}
