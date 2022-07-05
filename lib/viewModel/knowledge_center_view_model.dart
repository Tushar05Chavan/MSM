import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/knowledge_center_response_model.dart';
import 'package:msm_unify/repo/knowledge_center_repo.dart';

class KnowledgeCenterViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    knowledgeCenterViewModel();
  }

  Future<void> knowledgeCenterViewModel({String? keyword}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<KnowledgeCenterResponseModel> response =
          await KnowledgeCenterRepo().knowledgeCenterRepo(keyword: keyword);
      print('knowledgeCenterViewModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
