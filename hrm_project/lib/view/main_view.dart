import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/controller/app_contoller.dart';
import 'package:hrm_project/controller/main_controller.dart';
import 'package:hrm_project/view/leave/leavestate_view.dart';
import 'package:hrm_project/view/tempview.dart';
import 'package:hrm_project/view/leave/leaverequest_view.dart';

class MainView extends GetView<MainController> {
  MainView({super.key});
  List<Widget> maincontent = [Tempview(), leavestate_view()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Center(
            child: maincontent[controller.naviindex],
          );
        },
      ),
      bottomNavigationBar: navi(),
    );
  }

  Obx navi() {
    return Obx(() {
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
