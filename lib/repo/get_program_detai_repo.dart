import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_program_detail_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetProgramDetailRepo extends ApiURLService {
  static Future<GetProgramDetailResponseModel> getProgramDetailRepo(
      {int? programId}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Program/GetDetail?ProgramId=$programId",
        apitype: APIType.aGet);
    GetProgramDetailResponseModel getProgramDetailResponseModel =
        GetProgramDetailResponseModel.fromJson(response);
    return getProgramDetailResponseModel;
  }
}
