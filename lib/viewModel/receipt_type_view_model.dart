import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/receipt_type_response_model.dart';
import 'package:msm_unify/repo/receipt_type_repo.dart';

class ReceiptTypeViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    receiptTypeViewModel();
  }

  Future<void> receiptTypeViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ReceiptTypeResponseModel> response =
          await ReceiptTypeRepo().receiptTypeRepo();
      print('receiptTypeRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
