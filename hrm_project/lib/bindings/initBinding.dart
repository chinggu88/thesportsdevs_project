import 'package:get/instance_manager.dart';
import 'package:hrm_project/controller/app_contoller.dart';

class Initbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApopController(), permanent: true);
  }
}
