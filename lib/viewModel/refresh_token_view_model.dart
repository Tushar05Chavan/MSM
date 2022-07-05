import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/refresh_token_response_model.dart';
import 'package:msm_unify/repo/refresh_token_repo.dart';

class RefreshTokenViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    refreshTokenViewModel();
  }

  Future<void> refreshTokenViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    try {
      RefreshTokenResponseModel response =
          await RefreshTokenRepo.growthAnalysisAdvanceRepo();
      _apiResponse = ApiResponse.complete(response);
      // response.token
    } catch (e) {
      print("growthAnalysisAdvanceRepo.........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
