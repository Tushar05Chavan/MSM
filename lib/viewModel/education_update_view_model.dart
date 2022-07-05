import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/education_update_repo.dart';

class EducationUpdateViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   addNewStudentViewModel();
  // }

  Future<void> educationUpdateViewModel(
      {int? applicationId,
      int? countryOfEducation,
      int? highestLevelEdu,
      int? gradeScheme,
      String? gradeAverage}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      EducationUpdateRepo.educationUpdateRepo(
          applicationId: applicationId,
          countryOfEducation: countryOfEducation,
          highestLevelEdu: highestLevelEdu,
          gradeScheme: gradeScheme,
          gradeAverage: gradeAverage);
      _apiResponse = ApiResponse.complete();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
