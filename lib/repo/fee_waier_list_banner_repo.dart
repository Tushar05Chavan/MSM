import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/fee_waier_list_banner_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class FeeWaierListBannerRepo extends ApiURLService {
  Future<List<FeeWaierListBannerResponseModel>> feeWaierListBannerRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/FeeWaiverDisplay/BannerList",
        apitype: APIType.aGet);

    List<FeeWaierListBannerResponseModel> feeWaierListBannerResponseModel =
        feeWaierListBannerResponseModelFromJson(jsonEncode(response));

    return feeWaierListBannerResponseModel;
  }
}
