import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/counsellor_response_model.dart';
import 'package:msm_unify/repo/counsellor_repo.dart';

class CounsellorViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    counsellorViewModel();
  }

  Future<void> counsellorViewModel({int? agentId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<CounsellorResponseModel> response =
          await CounsellorRepo().counsellorRepo(agentId: agentId);
      print('counsellorRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
  }
}
