import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/province_country_response_model.dart';
import 'package:msm_unify/repo/province_country_repo.dart';

class ProvinceCountryViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
 
  
  ApiResponse get apiResponse => _apiResponse;

  

  Future<void> provinceCountryViewModel(int? countryId) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ProvinceCountryResponseModel> response =
          await ProvinceCountryRepo().provinceCountryRepo(countryId: countryId);
      print('ProvinceCountryResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
