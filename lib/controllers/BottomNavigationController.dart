import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int index = 0;

  void setIndex(int index) {
    this.index = index;
    update();
  }
}
