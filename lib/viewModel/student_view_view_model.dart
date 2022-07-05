import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/repo/student_view_repo.dart';

class StudentViewViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   applicationViewViewModel();
  // }

  Future<void> studentViewViewModel({int? studentId}) async {
    print('=========$studentId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      StudentViewResponseModel response =
          await StudentViewRepo.studentViewRepo(studentId: studentId);
      print('STUDENT VIEW MODEL RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERRORRRRR>>>>>  $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
