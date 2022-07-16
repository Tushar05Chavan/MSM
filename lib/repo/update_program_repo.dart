import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_url.dart';

class UpdateProgramRepo extends ApiURLService {
  static Future<bool> updateProgramRepo(Map<String, dynamic> body) async {
    // var response = await APIService().getResponse(
    //   url: "${BaseUrl.baseUrl}/Student/Add",
    //   apitype: APIType.aPost,
    //   body: body,
    // );
    //
    // return response;
    var headers = {
      'Authorization': '${Get.find<AppData>().loginResponseModel.token}',
      'Content-Type': 'application/json',
    };
    var request =
        await http.Request('POST', Uri.parse('${BaseUrl.baseUrl}/Application/UpdateProgramInfo'));
    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('mmmmmm');
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);

      return false;
    }
  }
}
