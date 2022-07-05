import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_education_province_response_model.dart';
import 'package:msm_unify/repo/student_education_province_repo.dart';

class EducationProvinceViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   applicationViewViewModel();
  // }

  Future<void> educationDropViewModel({int? countryId}) async {
    print('=========$countryId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<EducationProvinceResponseModel> response =
          await EducationProvinceRepo.educationProvinceRepo(
              countryId: countryId);
      print('EDUCATION PROVINCE DROP RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERRORRRRR>>>>>  $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
