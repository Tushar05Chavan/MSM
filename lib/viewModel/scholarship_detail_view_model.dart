import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/scholarship_detail_response_model.dart';
import 'package:msm_unify/repo/scholarship_detail_repo.dart';

class ScholarshipDetailViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    scholarshipDetailViewModel();
    scholarshipProgramInfo();
  }

  Future<void> scholarshipDetailViewModel(
      {int? instituteId,
      String? program,
      int? countryId,
      double? minAmt,
      double? maxAmt,
      int? type}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ScholarshipdetailResponseModel> response =
          await ScholarshipDetailRepo.scholarshipDetailRepo(
              instituteId: instituteId,
              program: program,
              countryId: countryId,
              minAmt: minAmt,
              maxAmt: maxAmt,
              type: type);
      print('SCHOLARSHIP DETAIL VIEW RESPONSE=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ERRORRRRR>>>>>  $e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  List<ScholarshipdetailResponseModel> listOfData = [];
  Future<void> scholarshipProgramInfo(
      {int? instituteId,
      String? program,
      int? countryId,
      double? minAmt,
      double? maxAmt,
      int? type}) async {
    print('institute Id==$instituteId');
    print('program Name===$program');
    print('country Id====$countryId');
    print('Partner Type====$type');
    print('Min Amount====$minAmt');
    print('Max Amount===$maxAmt');
    print(instituteId ?? 0);
    await scholarshipDetailViewModel(
        instituteId: instituteId ?? 0,
        program: program ?? '',
        countryId: countryId ?? 0,
        minAmt: minAmt ?? 0.0,
        maxAmt: maxAmt ?? 0.0,
        type: type ?? 0);
    List<ScholarshipdetailResponseModel> response1 = apiResponse.data;
    listOfData.clear();
    print('response=====$response1');
    response1.forEach((element) {
      listOfData.add(element);
      //   setListOfData(value: element);
    });
  }
}
