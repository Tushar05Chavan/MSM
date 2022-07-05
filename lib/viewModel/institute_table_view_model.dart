import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';

import '../model/responseModek/institute_table_response_model.dart';
import '../repo/institute_table_repo.dart';

class InstituteTableViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    institutetableviewmodel();
  }

  Future<void> institutetableviewmodel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<InstituteResponceModel> response =
          await InstituteTableRepo.instituteRepo();
      //print('INSTITUTE DATA =>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERORRRRRRRRRRRRRRRRR >>> $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
