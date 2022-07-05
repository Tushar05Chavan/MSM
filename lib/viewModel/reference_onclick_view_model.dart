import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/reference_onclick_response_model.dart';
import 'package:msm_unify/repo/reference_onclick_repo.dart';

class ReferenceOnclickViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    referenceOnclickViewModel();
  }

  Future<void> referenceOnclickViewModel({int? refId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ReferOnclickResponseModel response =
          await ReferenceOnclickRepo.referenceOnclickRepo(refId: refId);
      print('REFERENCE ONCLICK DATA=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........ERORR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
