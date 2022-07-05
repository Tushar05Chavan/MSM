import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/delete_student_repo.dart';

class StudentDeleteViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    studentDeleteViewModel();
  }

  Future<void> studentDeleteViewModel({int? studentId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      StudentDeleteRepo.studentDeleteRepo(studentId: studentId);
      _apiResponse = ApiResponse.complete();
    } catch (e) {
      print(".........ERORRRRR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
