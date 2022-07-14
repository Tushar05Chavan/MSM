import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/what_do_you_want_response_model.dart';
import 'package:msm_unify/repo/add_new_student_repo.dart';
import 'package:msm_unify/repo/what_do_you_want_repo.dart';

class WhatDoYouWantViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   addNewStudentViewModel();
  // }
  // String? res;
  // Future<void> whatDoYouWantViewModel(Map<String, dynamic>? model) async {
  //   _apiResponse = ApiResponse.loading(message: 'Loading');
  //   update();
    // try {
    //   List<WhatDoYouWantResponseModel> response =
    //       await WhatDoYouWantRepo.whatDoYouWantRepo();
    //  // var response = WhatDoYouWantRepo.whatDoYouWantRepo();
    //   _apiResponse = ApiResponse.complete(response);
    //   // print('View ModelRESPONSE=$response');
    // } catch (e) {
    //   print(".........>$e");
    //   _apiResponse = ApiResponse.error(message: 'error');
    // }
    //update();
  //}

    onInit() {
    whatDoYouWantViewModel();
  }

  Future<void> whatDoYouWantViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    try {
      List<WhatDoYouWantResponseModel> response = await WhatDoYouWantRepo().whatDoYouWantRepo();
      print('WhatDoYouWantResponseModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
  }

}
