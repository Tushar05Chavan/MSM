import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_application_response_model.dart';
import 'package:msm_unify/repo/student_application_repo.dart';

class StudentApplicationViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> studentApplicationViewModel({int? studentId}) async {
    print('=========$studentId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<StudApplicationResponseModel> response =
          await StudentApplicationViewRepo.studApplicationViewRepo(
              studentId: studentId);
      print('STUDENT APPLICATION MODEL RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print("ERRORRRRR>>>>>  $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
