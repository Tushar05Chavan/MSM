import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/repo/country_repo.dart';

class CountryViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    countryViewModel();
  }

  Future<void> countryViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    try {
      List<CountryResponseModel> response = await CountryRepo().countryRepo();
      print('CountryResponseModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
  }
}
