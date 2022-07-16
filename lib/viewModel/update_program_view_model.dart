import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/add_new_student_repo.dart';
import 'package:msm_unify/repo/update_program_repo.dart';

class UpdateProgramViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   addNewStudentViewModel();
  // }
  String? res;
  Future<void> updateProgramViewModel(Map<String, dynamic>? model) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      var response = UpdateProgramRepo.updateProgramRepo(model!);
      _apiResponse = ApiResponse.complete(response);
      // print('View ModelRESPONSE=$response');
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
