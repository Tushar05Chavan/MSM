import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/profile_branch_response_model.dart';
import 'package:msm_unify/repo/profile_branch_repo.dart';

class ProfileBranchViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    profileBranchViewModel();
  }

  Future<void> profileBranchViewModel({String? agentId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<BranchResponseModel> response =
          await ProfileBranchRepo.profileBranchRepo(agentId: agentId);
      print('BRANCH =>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........ERORR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
