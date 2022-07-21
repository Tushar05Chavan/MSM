import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/add_notes_application_repo.dart';
import 'package:msm_unify/repo/add_student_notes_repo.dart';
import 'package:msm_unify/viewModel/get_student_notes_view_model.dart';

class AddStudentNotesViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   addStudentNotesViewModel();
  // }

  Future<void> addStudentNotesViewModel(Map<String, dynamic>? model) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    update();
    try {
      var response = AddStudentNotesRepo.addStudentNotesRepo(model!);
      _apiResponse = ApiResponse.complete(response);
      
      update();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
