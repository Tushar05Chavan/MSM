import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentViewRepo extends ApiURLService {
  static Future<StudentViewResponseModel> studentViewRepo(
      {int? studentId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Student/View?StudentId=$studentId",
      apitype: APIType.aPost,
    );
    print('url====${'${BaseUrl.baseUrl}/Student/View?StudentId=$studentId'}');
    StudentViewResponseModel studentViewResponseModel =
        StudentViewResponseModel.fromJson(response);
    return studentViewResponseModel;
  }
}
