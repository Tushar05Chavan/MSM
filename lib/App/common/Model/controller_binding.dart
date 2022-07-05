import 'package:get/get.dart';
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/Screens/Dashboard/controller/dashboard_controller.dart';
import 'package:msm_unify/App/Screens/FeeWaierLists/controller/feewaier_controller.dart';

import '../../Screens/Authentication/Login/Controller/login_controller.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppData>(() => AppData(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.lazyPut<FeeWaierController>(() => FeeWaierController(), fenix: true);
  }
}
