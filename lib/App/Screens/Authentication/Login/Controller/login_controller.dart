import 'dart:convert';
import 'dart:developer';

import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/App/common/preference_manager.dart';

class LoginController extends GetxController {
  var userInputEmail = ''.obs;
  var userInputPassword = ''.obs;
  bool checkbox = false;

  void setCheckBox(value) {
    checkbox = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginCredentials() async {
    final keys = Key.fromUtf8('123456\$#@\$^@1ERF');
    final iv = IV.fromUtf8('123456\$#@\$^@1ERF');
    final encrypter = Encrypter(AES(keys, mode: AESMode.cbc, padding: 'PKCS7'));
    var hassPassword = encrypter.encrypt(userInputPassword.value, iv: iv);
    var headers = {
      'Referer': 'localhost:4200',
      'Content-Type': 'application/json'
    };
    try {
      // http.Response response = await http.post(Uri.parse('${BaseUrl.baseUrl}/Authentication/Login'));

      var request = http.Request(
          'POST', Uri.parse('${BaseUrl.baseUrl}/Authentication/Login'));
      request.body = json.encode({
        "username": userInputEmail.value,
        "Password": hassPassword.base64,
        "LoginType": "0",
        "ip": "0.0.0.0"
      });
      request.headers.addAll(headers);

      var response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();

        print('$respStr');

        Get.find<AppData>().userData(jsonDecode(respStr));

        await PreferenceManager.setEmailId(
            Get.find<AppData>().loginResponseModel.rslt!.emailId.toString());
        print('SET EMAIL ID>>>>>>>>>>>>  ${PreferenceManager.getEmailId()}');
      } else {
        print('Error ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
