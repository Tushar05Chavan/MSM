import 'package:get/get.dart';

class CommonDrawerController extends GetxController {
  bool isEx = false;
  bool isEx1 = false;
  bool isEx2 = false;

  void getIsEx() {
    isEx = !isEx;
    update();
  }

  void getIsEx1() {
    isEx1 = !isEx1;
    update();
  }

  void getIsEx2() {
    isEx2 = !isEx2;
    update();
  }
}
