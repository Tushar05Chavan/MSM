import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_visa_response_model.dart';
import 'package:msm_unify/repo/student_visa_repo.dart';

class StudentVisaViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> studentVisaViewModel({int? studentId}) async {
    print('=========$studentId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<StudentVisaResponseModel> response =
          await StudentVisaRepo.studentVisaRepo(
              studentId: studentId);
      print('STUDENT VisaL RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print("ERRORRRRR>>>>>  $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

}
