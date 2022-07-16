import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_forms_detail_response_model.dart';
import 'package:msm_unify/repo/get_forms_details_repo.dart';

class GetFormDetailsViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getFormDetailsViewModel(institutionId: 0, keyword: '');
  }

  Future<void> getFormDetailsViewModel(
      {int? institutionId, String? keyword}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetFormsDetailsResponseModel> response =
          await GetFormsDetailsRepo.getFormsDetailsRepo(
              institutionId: institutionId, keyword: keyword);
      print('GetFormsDetailsResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
