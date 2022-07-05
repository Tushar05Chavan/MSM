import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/country_for_search_response_model.dart';
import 'package:msm_unify/repo/country_for_search_repo.dart';

class CountryForSearchViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    countryForSearchViewModel();
  }

  Future<void> countryForSearchViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<CountryForSearchProgramResponseModel> response =
          await CountryForSearchRepo().countryForSearchRepo();
      print('countryForSearchRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
