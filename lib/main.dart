import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/Screens/Authentication/Login/Views/login_screen.dart';
import 'package:msm_unify/App/Screens/Dashboard/dashboard.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/App/common/preference_manager.dart';

import 'App/common/Model/controller_binding.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kColorPrimary, // status bar color
      statusBarIconBrightness: Brightness.dark));
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_function_type_syntax_for_parameters
  AppData appData = Get.put(AppData());
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (BuildContext context, child) {
          return GetMaterialApp(
            initialBinding: ControllerBindings(),
            debugShowCheckedModeBanner: false,
            smartManagement: SmartManagement.full,
            title: 'MSM UNIFY',
            theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
            home: (PreferenceManager.getEmailId() == null ||
                    PreferenceManager.getEmailId() == '')
                ? LoginScreen()
                : const DashboardPage(),
          );
        });
  }
}
