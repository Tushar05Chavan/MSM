import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/scholarship_response_model.dart';
import 'package:msm_unify/repo/scholarship_repo.dart';

class ScholarshipViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    scholarshipViewModel();
  }

  Future<void> scholarshipViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ScholarshipResponseModel> response =
          await ScholarshipRepo().scholarshipRepo();
      print('Scholarship Response Model=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }


}
