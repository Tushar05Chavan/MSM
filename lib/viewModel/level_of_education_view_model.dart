import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/level_of_education_response_model.dart';
import 'package:msm_unify/repo/level_of_education_repo.dart';

class LevelOfEducationViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    levelOfEducationViewModel();
  }

  Future<void> levelOfEducationViewModel({int? parentId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<LevelOfEducationResponseModel> response =
          await LevelOfEducationRepo.levelOfEducationRepo(parentId: parentId);
      print('levelOfEducationRepo=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> educationHistoryModel(
      {required Map<String, dynamic> map}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      bool response = await LevelOfEducationRepo.educationHistoryRepo(map: map);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
