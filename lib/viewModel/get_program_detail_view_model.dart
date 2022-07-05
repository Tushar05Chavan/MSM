import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_program_detail_response_model.dart';
import 'package:msm_unify/repo/get_program_detai_repo.dart';

class GetProgramDetailViewViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   applicationViewViewModel();
  // }

  Future<void> getProgramDetailViewViewModel({int? programId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      GetProgramDetailResponseModel response =
          await GetProgramDetailRepo.getProgramDetailRepo(
        programId: programId,
      );
      print('getProgramDetailRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
