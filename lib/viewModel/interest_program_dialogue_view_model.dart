import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/interest_dialogue_response_model.dart';

import '../repo/program_interest_dialogue_repo.dart';

class ProgramDialogueViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> programDialogueViewModel({int? instituteId}) async {
    print('=========$instituteId');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<InstituteDialogueResponseModel> response =
          await ProgramDropRepo.programDropRepo(instituteId: instituteId);
      print('PROGRAM DROP RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERRORRRRR>>>>>  $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
