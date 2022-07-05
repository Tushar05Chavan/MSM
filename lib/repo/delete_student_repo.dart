import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentDeleteRepo extends ApiURLService {
  static studentDeleteRepo({int? studentId}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Student/Delete?StudentId=$studentId",
      apitype: APIType.aPost,
    );
  }
}
