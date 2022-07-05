import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/scholarship_more_detail_repo.dart';

import '../model/responseModek/scholarship_more_detail_response_model.dart';

class ScholarshipMoreDetailViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> scholarshipMoreDetailViewModel({int? instituteId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ScholarshipMoreDetailResponseModel> response =
          await ScholarshipMoreDetailRepo.scholarshipMoreDetailRepo(
              instituteId: instituteId);
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........ERROR>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
