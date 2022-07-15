import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';

import 'package:msm_unify/model/responseModek/news_response_model.dart';

import 'package:msm_unify/repo/news_repo.dart';

class NewsViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    newsViewModel();
  }

  Future<void> newsViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<NewsResponseModel> response = await NewsRepo.newsRepo();
      print('NewsResponseModel=>${response}');
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
