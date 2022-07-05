import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/test_score_update_repo.dart';

class TextScoreUpdateViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   addNewStudentViewModel();
  // }

  Future<void> textScoreUpdateViewModel(
      {int? applicationId,
      int? studentId,
      double? listing,
      double? reading,
      double? writing,
      double? speaking,
      double? overAll}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      TestScoreUpdateRepo.testScoreUpdateRepo(
          applicationId: applicationId,
          studentId: studentId,
          listing: listing,
          reading: reading,
          writing: writing,
          speaking: speaking,
          overAll: overAll);
      _apiResponse = ApiResponse.complete();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
