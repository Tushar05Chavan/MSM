import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/application_program_of_program_response_model.dart';
import 'package:msm_unify/repo/application_program_of_program_repo.dart';

class ApplicationProgramOfProgramViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> applicationProgramOfProgramViewModel(
      {int? institutionId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ApplicationProgramOfProgramResponseModel> response =
          await ApplicationProgramOfProgramRepo.applicationProgramOfProgramRepo(
              institutionId: institutionId);
      print('applicationProgramOfProgramRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
