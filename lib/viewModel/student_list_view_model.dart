import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_list_response_model.dart';
import 'package:msm_unify/repo/student_list_repo.dart';

class StudentListViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    studentListViewModel(keyword: '');
  }

  Future<void> studentListViewModel({required String keyword}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    try {
      StudentListResponseModel response =
          await StudentListRepo.studentListRepo(keyword: keyword);
      print('studentListViewModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
