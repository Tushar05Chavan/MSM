import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/scholarship_know_more_response_model.dart';
import 'package:msm_unify/repo/scholarship_know_more_repo.dart';

class ScholarshipKnowMoreViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    scholarshipKnowMoreViewModel();
  }

  Future<void> scholarshipKnowMoreViewModel({int? programId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ScholarshipKnowMoreResponseModel response =
          await ScholarshipKnowMoreRepo.scholarshipKnowMoreRepo(
              programId: programId);
      print('Scholarship Know More Response=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........ERORR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
