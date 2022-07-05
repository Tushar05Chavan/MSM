import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/student_education_update_repo.dart';

class StudentEduUpdateViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> studentEduUpdateViewModel(
      {int? studentId,
      int? countryOfEducation,
      int? highestLevelEdu,
      int? gradeScheme,
      String? gradeAverage}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      StudentEduUpdateRepo.studentEduUpdateRepo(
          studentId: studentId,
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
