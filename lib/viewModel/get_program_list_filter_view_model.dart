import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_program_list_filter_response_model.dart';
import 'package:msm_unify/repo/get_program_list_filter_repo.dart';

class GetProgramListFilterViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    getProgramListFilterViewModel();
  }

  Future<void> getProgramListFilterViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    try {
      GetProgramListFilterResponseModel response =
          await GetProgramListFilterRepo.getProgramListFilterRepo();
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
