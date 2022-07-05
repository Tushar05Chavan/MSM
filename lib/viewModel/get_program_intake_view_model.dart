import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_program_intake_response_model.dart';
import 'package:msm_unify/repo/get_program_intake_repo.dart';

class GetProgramIntakeViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getProgramIntakeViewModel(
      {int? programId, int? applicationId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    try {
      List<GetProgramIntake> response =
          await GetProgramIntakeRepo.getProgramIntakeRepo(
              programId: programId, applicationId: applicationId);
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
