import 'package:get/get.dart';
import 'package:hrm_project/model/playerinfo.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  final _number = 0.obs;

  ///int
  int get number => _number.value;
  set number(int value) => _number.value = value;

  final _name = 'thesportdev'.obs;

  ///String
  String get name => _name.value;
  set name(String value) => _name.value = value;

  final _score = 0.0.obs;

  ///double
  double get score => _score.value;
  set score(double value) => _score.value = value;

  final _ischeck = false.obs;

  ///bool
  bool get ischeck => _ischeck.value;
  set ischeck(bool value) => _ischeck.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _name.value = 'thesportdevss';
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void aaa() {}
}
