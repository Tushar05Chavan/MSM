import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_list_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentListRepo extends ApiURLService {
  static Future<StudentListResponseModel> studentListRepo() async {
    // Map<String, dynamic> body = {"keyword": "all"};
    final body = '{"keyword":"all"}';
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Student/ListDetailed",
        apitype: APIType.aPost,
        body: {"keyword": "all"});

    print('--res ${response}');
    StudentListResponseModel studentListResponseModel =
        StudentListResponseModel.fromJson(response);
    // print('=========jjjj${tilesResponseModel.first}');
    return studentListResponseModel;
  }
}
