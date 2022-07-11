import 'dart:convert';

import 'package:msm_unify/model/responseModek/news_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class NewsRepo extends ApiURLService {
  static Future<List<NewsResponseModel>> newsRepo() async {
    var response = await APIService().getResponse(
        url: "https://www.msmunify.com/wp-json/wp/v2/posts?per_page=4",
        apitype: APIType.aGet);

    print('--res ${response}');
    List<NewsResponseModel> newsResponseModel =
        newsResponseModelFromJson(jsonEncode(response));
     print('=========jjjj${newsResponseModel.first}');
    return newsResponseModel;
  }
}
