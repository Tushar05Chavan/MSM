import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';

import '../model/responseModek/report_student_response_model.dart';
import '../repo/report_student_repo.dart';

class ReportStudentViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    reportStudentViewModel();
  }

  Future<void> reportStudentViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      StudentResponseModel response =
          await ReportStudentRepo.reportStudentRepo();
      print('STUDENT ANALYSIS DATA =>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERORRRRRRRRRRRRRRRRR >>> $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
