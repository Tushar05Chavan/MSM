import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/student_document_response_model.dart';
import 'package:msm_unify/repo/student_document_repo.dart';

class StudentDocumentViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> studentDocumentViewModel(
      {int? applicationId, int? programId, int? countryId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetStudentDocumentResponseModel> response =
          await StudentDocumentRepo().studentDocumentRepo(
              applicationId: applicationId,
              programId: programId,
              countryId: countryId);
      print('StudentDocumentResponseModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
