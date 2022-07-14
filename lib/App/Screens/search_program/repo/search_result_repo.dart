import 'dart:convert';

import 'package:msm_unify/App/Screens/search_program/model/search_inst_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class SearchResultRepo extends ApiURLService {
  Future<List<SearchResultModel>> searchResult(
      Map<String, dynamic> body) async {
    try {
      final response = await APIService().getResponse(
          body: body,
          url:
              "https://unify-qa-api.azurewebsites.net/Reports/SearchProgramForAgent",
          apitype: APIType.aPost);
      print(response);
      List<SearchResultModel> searchResultModel = [];
      response.forEach((element) {
        searchResultModel.add(SearchResultModel.fromJson(element));
      });
      print(searchResultModel);
      return searchResultModel;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
