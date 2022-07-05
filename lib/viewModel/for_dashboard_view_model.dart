import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/for_dashboard_response_model.dart';
import 'package:msm_unify/repo/for_dashboard_repo.dart';

class ForDashboardViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    forDashboardViewModel();
  }

  Future<void> forDashboardViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ForDashboardResponseModel> response =
          await ForDashboardRepo().forDashboardRepo();
      print('ForDashboardResponseModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
