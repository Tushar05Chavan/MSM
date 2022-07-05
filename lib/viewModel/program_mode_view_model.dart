import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/program_mode_response_model.dart';
import 'package:msm_unify/repo/program_mode_repo.dart';

class ProgramModeViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> programModeViewModel({int? programId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ProgramModeResponseModel> response =
          await ProgramModeRepo.programModeRepo(programId: programId);
      print('programModeRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
