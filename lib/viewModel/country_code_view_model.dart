import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/country_code_relation_response_model.dart';
import 'package:msm_unify/repo/country_code_repo.dart';

class CountryCodeViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    countryCodeViewModel();
  }

  Future<void> countryCodeViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<CountryCodeResponseModel> response =
          await CountryCodeRepo().countryCodeRepo();
      print('countryCodeViewModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
