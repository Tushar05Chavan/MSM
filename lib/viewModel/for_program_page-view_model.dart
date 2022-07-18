import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/for_program_page_response_model.dart';
import 'package:msm_unify/repo/for_program_page_repo.dart';

class ForProgramPageViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> forProgramPageViewModel({required int programId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      await ForProgramPageRepo()
          .forProgramPageRepo(programId: programId)
          .then((value) {
        ForProgramPageResponseModel response = value;
        print('ForProgramPageResponseModel=>${response}');
        _apiResponse = ApiResponse.complete(response);
        update();
      });
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  List data1 = [];
  Future<void> forProgramPage({int? programId}) async {
    await forProgramPageViewModel(programId: programId!);
    ForProgramPageResponseModel data = apiResponse.data;
    data1.add(data);
  }
}
