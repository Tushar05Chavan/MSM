import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
//import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/model/responseModek/destination_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class DestinationRepo extends ApiURLService {
  Future<List<DestinationResponseModel>> destinationRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/InstPage_ListParam2", 
        apitype: APIType.aGet);
    List<DestinationResponseModel> destinationResponseModel =
        destinationResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${destinationResponseModel.first}');
    return destinationResponseModel;
  }
}
