import 'package:get/get.dart';

class ApopController extends GetxController {
  static ApopController get to => Get.find();

  final _index = 0.obs;

  ///int
  int get index => _index.value;
  set index(int value) => _index.value = value;
}
