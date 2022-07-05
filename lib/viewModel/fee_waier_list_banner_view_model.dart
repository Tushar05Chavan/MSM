import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/fee_waier_list_banner_response_model.dart';
import 'package:msm_unify/repo/fee_waier_list_banner_repo.dart';

class FeeWaierListBannerViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    feeWaierListBannerViewModel();
  }

  Future<void> feeWaierListBannerViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<FeeWaierListBannerResponseModel> response =
          await FeeWaierListBannerRepo().feeWaierListBannerRepo();
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
