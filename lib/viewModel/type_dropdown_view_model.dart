import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/type_dropdown_response_model.dart';

import '../repo/type_dropdown_repo.dart';

class TypeDropViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   applicationViewViewModel();
  // }

  Future<void> typeDropViewModel({int? countryId}) async {
    print('=========$countryId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<TypeDropResponseModel> response =
          await TypeDropRepo.typeDropRepo(countryId: countryId);
      print('TYPE DROP RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERRORRRRR>>>>>  $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
