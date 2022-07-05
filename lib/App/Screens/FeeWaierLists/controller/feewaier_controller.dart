import 'package:get/get.dart';

class FeeWaierController extends GetxController {
  int selectedPage = 0;
  void setSelectedPage(int value) {
    selectedPage = value;
    update();
  }
}
