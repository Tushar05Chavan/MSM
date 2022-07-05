import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/growth_analysis_advance_response_model.dart';
import 'package:msm_unify/repo/growth_analysis_advance_repo.dart';

class GrowthAnalysisAdvanceViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    growthAnalysisAdvanceViewModel();
  }

  Future<void> growthAnalysisAdvanceViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      GrowthAnalysisAdvanceResponseModel response =
          await GrowthAnalysisAdvanceRepo.growthAnalysisAdvanceRepo();
      print('growthAnalysisAdvanceRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
