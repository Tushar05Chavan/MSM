import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/defferal_view_response_model.dart';
import 'package:msm_unify/repo/dafferal_view_repo.dart';

class DefferalViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    defferalViewModel();
  }

  Future<void> defferalViewModel({int? applicationId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      DefferalViewResponseModel response =
          await DefferalViewRepo.deferalViewRepo(applicationId: applicationId);
      print('Defferal View repo RESPONSE====>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
