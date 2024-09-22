import 'package:get/get.dart';


class BaseController extends GetxController {
  int currentIndex = 0;

  void changeScreen(int index) {
    currentIndex = index;
    update();
  }
}
