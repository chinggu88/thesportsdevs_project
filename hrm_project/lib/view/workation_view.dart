import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/controller/workation_controller.dart';
import 'package:o3d/o3d.dart';

class workation_view extends GetView<workationcontroller> {
  workation_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.size.width,
            height: Get.size.height,
            alignment: Alignment.center,
            child: O3D(
              controller: controller.o3d,
              src: 'assets/models/low_poly_people_free_sample_pack.glb',
              ar: false,
              autoPlay: true,
              cameraControls: false,
              onWebViewCreated: (value) {},
            ),
          ),
          Obx(() {
            if (controller.pageindex == 1) {
              return initpage();
            } else if (controller.pageindex == 2) {
              return leaverequest();
            } else {
              return initpage();
            }
          }),
        ],
      ),
    );
  }

  //초기이미지
  Widget initpage() {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: () => controller.startleave(),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent),
                  child: Text('휴가신청'))),
          SizedBox(
            width: 50,
          ),
          GestureDetector(
              onTap: () => controller.close(),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent),
                  child: Text('닫기'))),
        ],
      ),
    );
  }

  //휴가신청
  Widget leaverequest() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      width: Get.size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('연차 기간: 2022-12-26 ~ 2023-12-25'),
          SizedBox(height: 10),
          Text('총: 10일 / 사용: 2일 / 잔여: 8일'),
          SizedBox(height: 10),
          GestureDetector(
              onTap: () => controller.close(),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent),
                  child: Text('닫기'))),
        ],
      ),
    );
  }
}
