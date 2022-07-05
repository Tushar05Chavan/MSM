import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/retrieve_application_repo.dart';

import '../model/responseModek/retrieve_application_response_model.dart';

class RetrieveAppViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    retrieveAppViewModel();
  }

  Future<void> retrieveAppViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<RetrieveAppResponseModel> response =
          await RetrieveApplicationRepo.retrieveAppRepo();
      print('RETRIEVE APPLICATION DATA =>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERORRRRRRRRRRRRRRRRR >>> $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
