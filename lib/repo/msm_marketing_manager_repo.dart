import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/msm_marketing_manager_respone_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class MSMMarketingManagerRepo extends ApiURLService {
  Future<List<MsmMarketingManagerResponseModel>>
      mSMMarketingManagerRepo() async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Application/MarketingManagerForApplication",
      apitype: APIType.aPost,
      body: {
        "InstitutionId": 34,
        "ProvinceId": null,
        "Applicationid": 107217,
        "CountryId": 0
      },
    );
    List<MsmMarketingManagerResponseModel> msmMarketingManagerResponseModel =
        msmMarketingManagerResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${msmMarketingManagerResponseModel.first}');
    return msmMarketingManagerResponseModel;
  }
}
