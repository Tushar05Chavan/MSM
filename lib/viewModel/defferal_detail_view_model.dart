import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';

import '../model/responseModek/defferal_detail_response_model.dart';
import '../repo/defferal_detail_view_repo.dart';

class DefferalDetailViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    defferalDetailViewModel();
  }

  Future<void> defferalDetailViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<DetailResModel> response =
          await DefferalDetailViewRepo().deferalDetailRepo();
      print('Details repo RESPONSE====>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
