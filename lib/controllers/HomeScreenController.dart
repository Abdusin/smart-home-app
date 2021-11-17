import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  int index = 0;

  void setIndex(int index) {
    this.index = index;
    update();
  }
}
