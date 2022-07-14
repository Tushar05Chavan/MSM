import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/search_program/model/search_inst_model.dart';
import 'package:msm_unify/App/Screens/search_program/view%20model/search_result_viewMode.dart';

class SearchController extends GetxController {
  List<SearchResultModel> searchResult = [];
  final SearchResultViewModel _searchResultViewModel =
      Get.put(SearchResultViewModel());
  Future<void> getSearchResults(Map<String, dynamic> body) async {
    await _searchResultViewModel.getSearchResults(body);
    searchResult = _searchResultViewModel.apiResponse.data;
    update();
  }
}
