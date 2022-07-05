import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/commission_response_model.dart';

import '../repo/commission_repo.dart';

class CommissionViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    commissionViewModel();
  }

  Future<void> commissionViewModel({int? agentId}) async {
    print("ID===$agentId");
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<CommissionResponseModel> response =
          await CommissionRepo().commissionRepo(agentId: agentId);
      print('COMMISSION RESPONSE====>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
