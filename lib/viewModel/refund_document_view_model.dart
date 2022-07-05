import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/refund_document_response_model.dart';
import 'package:msm_unify/repo/refund_dcoument_repo.dart';

class RefundDocumentViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    refundDocumentViewModel();
  }

  Future<void> refundDocumentViewModel({int? applicationId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<RefundDocumentResponseModel> response =
          await RefundDocumentRepo.refundDocumentRepo(
              applicationId: applicationId);
      print('REFUND DOCUMENT=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........ERORR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
