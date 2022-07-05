import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/new_program_arrivals_enhance_response_model.dart';
import 'package:msm_unify/repo/get_new_program_arrivalsEenhance_repo.dart';

class NewProgramArrivalsEnhanceViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    newProgramArrivalsEnhanceViewModel();
  }

  Future<void> newProgramArrivalsEnhanceViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<NewProgramArrivalsEnhanceResponseModel> response =
          await NewProgramArrivalsEnhanceRepo.newProgramArrivalsEnhanceRepo();
      print('NewProgramArrivalsEnhanceResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
