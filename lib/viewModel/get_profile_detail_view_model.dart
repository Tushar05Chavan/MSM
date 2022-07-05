import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/get_profile_detail_repo.dart';

class ProfileDetailViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> profileDetailViewModel(Map<String, dynamic> body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ProfileDetailRepo.profileDetailRepo(body);
      _apiResponse = ApiResponse.complete();
    } catch (e) {
      print("ERRORRRR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
