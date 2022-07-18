import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/for_program_page_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ForProgramPageRepo extends ApiURLService {
  Future<ForProgramPageResponseModel> forProgramPageRepo(
      {int? programId}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Program/ForProgramPage/ProgramId=$programId",
        apitype: APIType.aGet);

    print('--res ${response}');
    ForProgramPageResponseModel forProgramPageResponseModel =
        ForProgramPageResponseModel.fromJson(response);
    // print('=========jjjj${tilesResponseModel.first}');
    return forProgramPageResponseModel;
  }
}
