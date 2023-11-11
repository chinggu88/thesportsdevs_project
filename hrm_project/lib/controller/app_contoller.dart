import 'package:get/get.dart';
import 'package:hrm_project/model/userinfo.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  final _index = 0.obs;

  ///int
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final _user = Userinfo().obs;

  Userinfo get user => _user.value;
  set user(Userinfo value) => _user(value);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user = Userinfo(
        name: "이강훈",
        hireYear: '20221201',
        jobTitle: "Developer",
        leavedays: 10,
        leavehours: 18,
        leaveminuts: 10);
  }
}
