import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/report_intake_institue_repo.dart';

import '../model/responseModek/report_intake_institute_response_model.dart';

class IntakeInstituteViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    intakeInstituteViewModel();
  }

  Future<void> intakeInstituteViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      IntakeInstituteResponseModel response =
          await IntakeInstituteRepo.intakeInstituteRepo();
      print('INTAKE INSTITUTE DATA =>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERORRRRRRRRRRRRRRRRR >>> $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
