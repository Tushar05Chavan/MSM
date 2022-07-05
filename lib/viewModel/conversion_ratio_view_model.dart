import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/conversion_ratio_response_model.dart';
import 'package:msm_unify/repo/conversion_ratio_repo.dart';

class ConversionRatioViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    conversionRatioViewModel();
  }

  Future<void> conversionRatioViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ConversionRatioResponseModel response =
          await ConversionRatioRepo.conversionRatioRepo();
      print('conversionRatioRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
