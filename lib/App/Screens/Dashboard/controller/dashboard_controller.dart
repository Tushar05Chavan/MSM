import 'package:get/get.dart';

class DashboardController extends GetxController {
  int selectedPage = 0;

  void setSelectedPage(int value) {
    selectedPage = value;
    update();
  }
}
