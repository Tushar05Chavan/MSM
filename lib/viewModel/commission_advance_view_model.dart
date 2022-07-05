import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/commisssion_advance_response_model.dart';
import 'package:msm_unify/repo/commission_advance_repo.dart';

class CommissionAdvanceViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    commissionAdvanceViewModel();
  }

  Future<void> commissionAdvanceViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      CommissionAdvanceResponseModel response =
          await CommissionAdvanceRepo.commissionAdvanceRepo();
      print('growthAnalysisAdvanceRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
