import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_student_notes_response_model.dart';
import 'package:msm_unify/repo/get_students_notes_repo.dart';

class GetStudentNotesViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    getStudentNotesViewModel();
  }

  Future<void> getStudentNotesViewModel({int? activityId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetStudentNotesResponseModel> response =
          await GetStudentNotesRepo.getStudentNotesRepo(activityId: activityId);
      print('GetStudentNotesResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
