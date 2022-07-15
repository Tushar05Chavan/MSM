import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_document_table_response_model.dart';
import 'package:msm_unify/repo/student_document_table_repo.dart';

class StudentDocViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> studentDocumentViewModel({int? parentId}) async {
    print('=========$parentId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<StudentDocumentResponseModel> response =
          await StudentDocRepo.studentDocRepo(parentId: parentId);
      print('STUDENT DOCUMENT MODEL RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print("ERRORRRRR>>>>>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
