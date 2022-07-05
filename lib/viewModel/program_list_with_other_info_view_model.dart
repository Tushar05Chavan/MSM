import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/program_list_with_other_info_response_model.dart';
import 'package:msm_unify/repo/program_list_with_other_info_repo.dart';

class ProgramListWithOtherInfoViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    programListWithOtherInfoViewModel();
    getProgramListWithOtherInfo();
  }

  Future<void> programListWithOtherInfoViewModel(
      {int? InstitutionId,
      String? ProgramName,
      int? CountryId,
      int? WaiverPer,
      int? PartnerTypeId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    try {
      List<ProgramListWithOtherInfoResponseModel> response =
          await ProgramListWithOtherInfoRepo.programListWithOtherInfoRepo(
              InstitutionId: InstitutionId,
              ProgramName: ProgramName,
              CountryId: CountryId,
              WaiverPer: WaiverPer,
              PartnerTypeId: PartnerTypeId);
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  List<ProgramListWithOtherInfoResponseModel> listOfData = [];
  Future<void> getProgramListWithOtherInfo(
      {int? partnerTypeId,
      String? programName,
      int? countryId,
      int? waiverPer,
      int? institutionId}) async {
    print('insId==$institutionId');
    print('programName===$programName');
    print('countryId====$countryId');
    print('waiverPer====$waiverPer');
    print('partnerTypeId===$partnerTypeId');
    print(institutionId ?? 0);
    await programListWithOtherInfoViewModel(
        PartnerTypeId: partnerTypeId ?? 0,
        ProgramName: programName ?? '',
        CountryId: countryId ?? 0,
        WaiverPer: waiverPer ?? 0,
        InstitutionId: institutionId ?? 0);
    List<ProgramListWithOtherInfoResponseModel> response1 = apiResponse.data;
    listOfData.clear();
    print('RESPONSE==$response1');
    response1.forEach((element) {
      listOfData.add(element);
      //   setListOfData(value: element);
    });
  }
}
