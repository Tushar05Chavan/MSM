import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/program_campus_response_model.dart';
import 'package:msm_unify/repo/program_campus_repo.dart';

class ProgramCampusViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  Future<void> programCampusViewModel({int? intakeId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    try {
      List<ProgramCampusResponseModel> response =
          await ProgramCampusRepo.programCampusRepo(intakeId: intakeId);
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
