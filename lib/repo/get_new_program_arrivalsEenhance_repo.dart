import 'dart:convert';
import 'package:msm_unify/model/responseModek/new_program_arrivals_enhance_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class NewProgramArrivalsEnhanceRepo extends ApiURLService {
  static Future<List<NewProgramArrivalsEnhanceResponseModel>>
      newProgramArrivalsEnhanceRepo() async {
    var response = await APIService().getResponse(
        url:
            "https://unify-qa-api.azurewebsites.net/Dashboard/NewProgramArrivalsEnhance",
        apitype: APIType.aGet);

    print('--res ${response}');
    List<NewProgramArrivalsEnhanceResponseModel>
        newProgramArrivalsEnhanceResponseModel =
        newProgramArrivalsEnhanceResponseModelFromJson(jsonEncode(response));
    // print('=========jjjj${tilesResponseModel.first}');
    return newProgramArrivalsEnhanceResponseModel;
  }
}
