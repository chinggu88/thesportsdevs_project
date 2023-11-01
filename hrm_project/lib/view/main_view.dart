import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/controller/app_contoller.dart';
import 'package:hrm_project/controller/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  // Get.toNamed('/kiamembers');
                  Get.offNamed('/kiamembers');
                },
                icon: Icon(Icons.move_down)),
            name(),
            IconButton(
                onPressed: () {
                  controller.name = 'change name';
                },
                icon: Icon(Icons.change_circle)),
            score(),
            IconButton(
                onPressed: () {
                  controller.score = 81;
                },
                icon: Icon(Icons.scale)),
            check(),
            IconButton(
                onPressed: () {
                  controller.ischeck = !controller.ischeck;
                },
                icon: Icon(Icons.scale)),
            idext(),
            IconButton(
                onPressed: () {
                  ApopController.to.index++;
                },
                icon: Icon(Icons.scale)),
          ],
        ),
      ),
    );
  }

  Obx name() {
    return Obx(() {
      log('chagne name');
      return Text('${controller.name}');
    });
  }

  Obx score() {
    return Obx(() {
      log('chagne score');
      return Text('${controller.score}');
    });
  }

  Obx check() {
    return Obx(() {
      log('chagne check');
      return controller.ischeck ? Text('확인') : Text('취소');
    });
  }

  Obx idext() {
    return Obx(() {
      log('chagne check11');
      return Text('${ApopController.to.index}');
    });
  }
}
