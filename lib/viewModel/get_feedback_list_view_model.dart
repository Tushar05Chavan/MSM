import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_feedback_list_response_model.dart';
import 'package:msm_unify/repo/get_feedback_list_repo.dart';

class GetFeedBackListViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    getFeedBackListViewModel();
  }

  Future<void> getFeedBackListViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetFeedbackListResponseModel> response =
          await GetFeedbackListRepo.getFeedbackListRepo();
      print('GetFeedBackListViewModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<bool> postFeedBackModel(Map<String, dynamic> map) async {
    late int response;
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      await GetFeedbackListRepo.feedbackAdd(map: map).then((value) {
        response = value;
      });
    } catch (e) {
      print(".........>$e");
    } finally {
      onInit();
    }
    return response > 0;
  }
}
