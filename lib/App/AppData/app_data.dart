import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:msm_unify/App/Screens/Dashboard/dashboard.dart';
import 'package:msm_unify/model/responseModek/login_response_model.dart';

import '../common/preference_manager.dart';

class AppData extends GetxController {
  late LoginResponseModel loginResponseModel;

  AppData() {
    getUserData();
  }

  Future<bool> getUserData() async {
    final box = GetStorage();
    final rawJson = box.read('loginUserData');
    if (rawJson != null) {
      loginResponseModel = LoginResponseModel.fromJson(jsonDecode(rawJson));

      return true;
    }
    return false;
  }

  void userData(Map<dynamic, dynamic> json) async {
    final box = GetStorage();
    String user = jsonEncode(json);
    await box.write('loginUserData', user);
    final rawJson = jsonDecode(box.read('loginUserData')!);
    loginResponseModel = LoginResponseModel.fromJson(rawJson);
    await PreferenceManager.setToken(loginResponseModel.token.toString());

    await PreferenceManager.setEmailId(
        loginResponseModel.rslt!.emailId.toString());
    Get.to(() => const DashboardPage());
  }
}
