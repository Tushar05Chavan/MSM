import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_feedback_list_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetFeedbackListRepo extends ApiURLService {
  static Future<List<GetFeedbackListResponseModel>>
      getFeedbackListRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Feedback/List", apitype: APIType.aGet);

    print('--res ${response}');
    List<GetFeedbackListResponseModel> getFeedbackListResponseModel =
        getFeedbackListResponseModelFromJson(jsonEncode(response));
    // print('=========jjjj${tilesResponseModel.first}');
    return getFeedbackListResponseModel;
  }
}
