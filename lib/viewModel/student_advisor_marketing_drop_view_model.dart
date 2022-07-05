import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/student_advisor_assign_marketing_drop_repo.dart';

import '../model/responseModek/student_advisor_assign_marketing_drop_response_model.dart';

class AdvisorMarketingViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    advisorMarketingViewModel();
  }

  Future<void> advisorMarketingViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<AdvisorMarketingResponseModel> response =
          await AdvisorMarketingDropRepo.marketingDropRepo();
      print('MARKETING DROP RESPONSE =>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERORRRRRRRRRRRRRRRRR >>> $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
