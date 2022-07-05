import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_program_intake_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetProgramIntakeRepo extends ApiURLService {
  static Future<List<GetProgramIntake>> getProgramIntakeRepo(
      {int? programId, int? applicationId}) async {
    var response = await APIService().getResponse(
      url:
          "${BaseUrl.baseUrl}/ProgramIntek/PromIntakeForApplication?ProgramId=$programId&ApplicationId=$applicationId&CountryId=101",
      apitype: APIType.aGet,
    );
    print(
        "url==${'https://msmunifyapicore.azurewebsites.net/ProgramIntek/PromIntakeForApplication?ProgramId=$programId&ApplicationId=$applicationId&CountryId=101'}");
    List<GetProgramIntake> getProgramIntake =
        getProgramIntakeFromJson(jsonEncode(response));
    print('=========jjjj${getProgramIntake.first}');
    return getProgramIntake;
  }
}
