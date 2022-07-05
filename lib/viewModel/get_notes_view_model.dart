import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_notes_response_model.dart';
import 'package:msm_unify/repo/get_notes_repo.dart';

class GetNotesViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    getNotesViewModel();
  }

  Future<void> getNotesViewModel({int? activityId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetNotesResponseModel> response =
          await GetNotesRepo.getNotesRepo(activityId: activityId);
      print('GetNotesResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
