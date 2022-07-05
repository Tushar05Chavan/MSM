import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/commission_institution_response_model.dart';
import 'package:msm_unify/repo/commission_institution_repo.dart';

class CommissionInstitutionViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  //
  // onInit() {
  //   commissionInstitutionViewModel();
  // }

  Future<void> commissionInstitutionViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<CommissionInstitutionResponseModel> response =
          await CommissionInstitutionRepo().commissionInstitutionRepo();
      print('commissionInstitutionRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
