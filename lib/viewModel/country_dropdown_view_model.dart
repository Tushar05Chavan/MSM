import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/country_dropdown_repo.dart';

import '../model/responseModek/country_dropdown_response_model.dart';

class CountryDropViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   commissionIntakeDropdownViewModel();
  // }

  Future<void> countryDropViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<CountryDropResponseModel> response =
          await CountryDropRepo().countryDropRepo();
      print('Country Drop RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
