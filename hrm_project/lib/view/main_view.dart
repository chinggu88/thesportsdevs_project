import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/controller/app_contoller.dart';
import 'package:hrm_project/controller/main_controller.dart';
import 'package:hrm_project/view/workation_view.dart';

class MainView extends GetView<MainController> {
  MainView({super.key});
  List<Widget> maincontent = [workation_view(), workation_view()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: Center(
        child: maincontent[controller.naviindex],
      ),
      bottomNavigationBar: navi(),
    );
  }

  Obx navi() {
    return Obx(() {
      log('chagne check11');
      return BottomNavigationBar(
          currentIndex: controller.naviindex,
          onTap: (index) {
            controller.naviindex = index;
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.work_history), label: '출퇴근'),
            BottomNavigationBarItem(
                icon: Icon(Icons.task_outlined), label: '휴가'),
          ]);
    });
  }
}
