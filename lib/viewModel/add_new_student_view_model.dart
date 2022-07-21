import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/add_new_student_repo.dart';

class AddNewStudentViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  bool clicked = false;
  String? res;
  Future<void> addNewStudentViewModel(Map<String, dynamic>? model) async {
    clicked = true;
    update();
    _apiResponse = ApiResponse.loading(message: 'Loading');
    
    update();
    try {
      var response = AddNewStudentRepo.addNewStudentRepo(model!);
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    clicked = false;
    update();
  }
}
