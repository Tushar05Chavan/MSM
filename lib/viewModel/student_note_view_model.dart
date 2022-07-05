import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_note_response_model.dart';
import 'package:msm_unify/repo/student_note_repo.dart';

class StudentNoteViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> studentNoteViewModel({int? activityId}) async {
    print('=========$activityId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<StudentNoteResponseModel> response =
          await StudentNoteRepo.studentNoteRepo(activityId: activityId);
      print('STUDENT NOTE MODEL RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERRORRRRR>>>>>  $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
