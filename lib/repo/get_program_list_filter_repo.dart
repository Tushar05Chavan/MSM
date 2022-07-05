import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_program_list_filter_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetProgramListFilterRepo extends ApiURLService {
  static Future<GetProgramListFilterResponseModel>
      getProgramListFilterRepo() async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/FeeWaiverDisplay/GetProgramListFilter",
        apitype: APIType.aGet);

    GetProgramListFilterResponseModel getProgramListFilterResponseModel =
        GetProgramListFilterResponseModel.fromJson(response);
    return getProgramListFilterResponseModel;
  }
}
