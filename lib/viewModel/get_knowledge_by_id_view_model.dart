import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/get_knowledge_by_id_response_model.dart';
import 'package:msm_unify/repo/get_knowledge_by_id_repo.dart';

class GetKnowledgeByIdViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getKnowledgeByIdViewModel({int? id}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      GetKnowledgeByIdResponseModel response =
          await GetKnowledgeByIdRepo.getKnowledgeByIdRepo(id: id);
      print('GetKnowledgeByIdResponseModel RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
