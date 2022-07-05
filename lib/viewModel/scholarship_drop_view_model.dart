import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/scholarship_dropdown_response_model.dart';
import 'package:msm_unify/repo/scholarship_dropdown_repo.dart';


class ScholarshipDropViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    scholarshipDropViewModel();
  }

  Future<void> scholarshipDropViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ScholarshipDropResponseModel response =
      await ScholarshipDropRepo().scholarshipDropRepo();
      print('Scholarship Dropdown Response Model=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }


}
