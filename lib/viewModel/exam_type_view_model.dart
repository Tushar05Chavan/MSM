import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/exam_type_response_model.dart';
import 'package:msm_unify/repo/exam_type_repo.dart';

class ExamTypeViewModel extends GetxController {
  String _examName = '';

  String get examName => _examName;

  void setExamName(String value) {
    _examName = value;
    update();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> examTypeViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<ExamTypeResponseModel> response =
          await ExamTypeViewRepo().examTypeViewRepo();
      print('examTypeViewRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
