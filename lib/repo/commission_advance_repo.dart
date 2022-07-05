import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/commisssion_advance_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class CommissionAdvanceRepo extends ApiURLService {
  static Future<CommissionAdvanceResponseModel> commissionAdvanceRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Reports/Dynamic/commission-report",
        apitype: APIType.aPost,
        body: {
          "InstitutionPartnerType": 0,
          "InstitutionId": 0,
          "AgentId": 9701,
          "ApplicationType": 1,
          "Duration": "1",
          "CountryId": "0",
          "CountryIdFilter": 0,
          "RegionId": 0,
          "IntakeId": 0,
          "StateId": 0,
          "fromdate": "2022-06-14T04:34:57.395Z",
          "todate": "2022-06-14T04:34:57.395Z",
          "SubReport": "",
          "Filter": 0
        });

    CommissionAdvanceResponseModel commissionAdvanceResponseModel =
        CommissionAdvanceResponseModel.fromJson(response);
    return commissionAdvanceResponseModel;
  }
}
