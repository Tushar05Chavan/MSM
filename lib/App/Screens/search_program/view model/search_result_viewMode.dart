import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/Screens/search_program/model/search_inst_model.dart';
import 'package:msm_unify/App/Screens/search_program/repo/search_result_repo.dart';

class SearchResultViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getSearchResults(Map<String, dynamic> data) async {
    try {
      _apiResponse = ApiResponse.loading(message: 'Loading');
      update();
      List<SearchResultModel> response =
          await SearchResultRepo().searchResult(data);
      _apiResponse = ApiResponse.complete(response);
      update();
    } catch (e) {
      _apiResponse = ApiResponse.error(message: 'error');
      update();
    }
  }
}
