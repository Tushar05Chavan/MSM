import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/document_dropdown_response_model.dart';
import 'package:msm_unify/repo/document_dropdown_repo.dart';

class DocumentDropViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    documentDropViewModel();
  }

  Future<void> documentDropViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    try {
      List<DocumentDropResponseModel> response =
          await DocumentDropRepo().documentDropRepo();
      print('DOCUMENT DROP RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERORR>>>>> $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
  }
}
