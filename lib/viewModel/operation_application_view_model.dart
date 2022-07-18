import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';

import '../model/responseModek/operation_application_response_model.dart';
import '../repo/operation_application_repo.dart';

class ApplicationViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    applicationViewModel(keyword : '');
  }

  Future<void> applicationViewModel({String? keyword}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ApplicationResponseModel response =
          await ApplicationTableRepo.applicationRepo();
      //print('APPLICATION DATA =>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERORRRRRRRRRRRRRRRRR >>> $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
