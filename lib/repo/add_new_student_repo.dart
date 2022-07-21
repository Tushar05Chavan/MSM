import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_url.dart';

class AddNewStudentRepo extends ApiURLService {
  static Future<bool> addNewStudentRepo(Map<String, dynamic> body) async {
  
    var headers = {
      'Authorization': '${Get.find<AppData>().loginResponseModel.token}',
      'Content-Type': 'application/json',
    };
  
    var request =
        await http.Request('POST', Uri.parse('${BaseUrl.baseUrl}/Student/Add'));
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
