import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/scholarship_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../model/responseModek/what_do_you_want_response_model.dart';

class WhatDoYouWantRepo extends ApiURLService {
    Future<List<WhatDoYouWantResponseModel>> whatDoYouWantRepo() async {
    print('hiiii');
    var response = await APIService().getResponse(
        url: "https://unify-qa-api.azurewebsites.net/Misc/InstPage_ListParam1", apitype: APIType.aGet);
    print('--res ${response}');
    List<WhatDoYouWantResponseModel> whatDoYouWantResponseModel =
        whatDoYouWantResponseModelFromJson(jsonEncode(response));
    print('=========Resssssssss${whatDoYouWantResponseModel.first}');
    return whatDoYouWantResponseModel;
  }
}
