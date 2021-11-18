import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int index = 0;
  var value = 20.0.obs;

  void setIndex(int index) {
    this.index = index;
    update();
  }

  void setValue(double value) {
    this.value.value = value;
  }
}
