import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_tiles_response_model.dart';
import 'package:msm_unify/repo/get_tiles_detail_repo.dart';

class GetTilesViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getTilesViewModel(duration: 1);
  }

  Future<void> getTilesViewModel({int? duration}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<TilesResponseModel> response =
          await GetTilesDetailsRepo().getTilesDetails(duration: duration);
      print('TilesResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
