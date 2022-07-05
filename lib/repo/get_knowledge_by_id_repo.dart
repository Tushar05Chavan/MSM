import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/get_knowledge_by_id_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class GetKnowledgeByIdRepo extends ApiURLService {
  static Future<GetKnowledgeByIdResponseModel> getKnowledgeByIdRepo(
      {int? id}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/KnowledgeCenter/Display?id=$id",
        apitype: APIType.aGet);

    GetKnowledgeByIdResponseModel getKnowledgeByIdResponseModel =
        GetKnowledgeByIdResponseModel.fromJson(response);
    return getKnowledgeByIdResponseModel;
  }
}
