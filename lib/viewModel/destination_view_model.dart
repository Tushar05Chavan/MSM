import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
//import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/model/responseModek/destination_response_model.dart';
//import 'package:msm_unify/repo/country_repo.dart';
import 'package:msm_unify/repo/destination_repo.dart';

class DestinationViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    destinationViewModel();
  }

  Future<void> destinationViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<DestinationResponseModel> response =
          await DestinationRepo().destinationRepo();
      print('DestinationResponseModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
      update();
    }
  }
}
