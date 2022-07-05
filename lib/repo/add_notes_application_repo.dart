import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class AddNotesRepo extends ApiURLService {
  static addNotesRepo(Map<String, dynamic> body) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Activity/Add",
      apitype: APIType.aPost,
      body: body,
    );
  }
}
