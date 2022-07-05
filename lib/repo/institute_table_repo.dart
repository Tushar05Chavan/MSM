import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/institute_table_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class InstituteTableRepo extends ApiURLService {
  static Future<List<InstituteResponceModel>> instituteRepo() async {
    final body = '{"keyword": ""}';
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Institute/ListForAgentDisplay",
        apitype: APIType.aPost,
        body: {"keyword": ""});

    //print('--responce ${response}');
    List<InstituteResponceModel> instituteResponceModel =
        instituteResponceModelFromJson(jsonEncode(response));
    //print('=========errorr');
    return instituteResponceModel;
  }
}
