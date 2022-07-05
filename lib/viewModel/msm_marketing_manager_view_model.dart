import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/msm_marketing_manager_respone_model.dart';
import 'package:msm_unify/repo/msm_marketing_manager_repo.dart';

class MsmMarketingManagerViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    msmMarketingManagerViewModel();
  }

  Future<void> msmMarketingManagerViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<MsmMarketingManagerResponseModel> response =
          await MSMMarketingManagerRepo().mSMMarketingManagerRepo();
      print('mSMMarketingManagerRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
  }
}
