import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/bindings/initBinding.dart';
import 'package:hrm_project/controller/workation_controller.dart';
import 'package:hrm_project/controller/main_controller.dart';
import 'package:hrm_project/firebase_options.dart';
import 'package:hrm_project/view/main_view.dart';
import 'package:hrm_project/view/leave/leaverequest_view.dart';

void main() async {
  // firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // runApp(ProviderScope(observers: [logger()], child: MyApp()));
  runApp(GetMaterialApp(
      initialBinding: Initbinding(),
      initialRoute: '/main',
      getPages: [
        GetPage(
            name: '/main',
            page: () => MainView(),
            binding: BindingsBuilder(() {
              Get.put(MainController(), permanent: true);
              Get.put(workationcontroller(), permanent: true);
            })),
        GetPage(
            name: '/leavsrequest',
            page: () => leaverequest_view(),
            binding: BindingsBuilder(() {})),
      ]));
}
