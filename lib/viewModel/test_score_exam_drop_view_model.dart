import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/test_score_exam_drop_repo.dart';

import '../model/responseModek/test_score_exam_drop_response_model.dart';

class TestScoreExamDropdownViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   commissionIntakeDropdownViewModel();
  // }

  Future<void> testScoreExamDropdownViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ExamDropResponseModel> response =
          await TestScoreExamDropdownRepo().testScoreExamDropdownRepo();
      //print('TestScoreExamDropdownRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
