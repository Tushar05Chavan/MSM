import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_document_response_model.dart';
import 'package:msm_unify/repo/get_student_document_repo.dart';

class GetStudentDocumentViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  Future<void> getStudentDocumentViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetStudentDocumentResponseModel> response =
          await GetStudentDocumentRepo.getStudentDocumentRepo();
      print('getStudentDocumentRepo=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
