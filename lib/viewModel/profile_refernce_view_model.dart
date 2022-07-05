import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/profile_reference_response_model.dart';
import 'package:msm_unify/repo/profile_reference_repo.dart';

class ProfileReferenceViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    profileReferenceViewModel();
  }

  Future<void> profileReferenceViewModel({String? agentId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ReferenceResponseModel> response =
          await ProfileReferenceRepo.profileReferenceRepo(agentId: agentId);
      print('REFERENCE DOCUMENT=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........ERORR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
