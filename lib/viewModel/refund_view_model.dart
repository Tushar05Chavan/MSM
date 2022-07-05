import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/refund_response_model.dart';
import 'package:msm_unify/repo/refund_repo.dart';

import '../model/responseModek/refund_document_response_model.dart';
import '../repo/refund_dcoument_repo.dart';

class RefundViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    refundViewModel();
  }

  Future<void> refundViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<RefundResponseModel> response = await RefundRepo.refundRepo();
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........ERROR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }


}
