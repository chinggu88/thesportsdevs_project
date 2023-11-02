import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/constant/screen.dart';
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
            } else if (controller.pageindex == 3) {
              return leavelist();
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
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.purpleAccent),
                  child: Text('휴가신청'))),
          SizedBox(
            width: 50,
          ),
          GestureDetector(
              onTap: () => controller.startleavelist(),
              child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.purpleAccent),
                  child: Text('휴가확인'))),
          SizedBox(
            width: 50,
          ),
          GestureDetector(
              onTap: () => controller.close(),
              child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.purpleAccent),
                  child: Text('닫기'))),
        ],
      ),
    );
  }

  //휴가신청
  Widget leaverequest() {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      width: Get.size.width,
      // decoration: BoxDecoration(color: Colors.teal[200]),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black.withOpacity(0.65),
              child: const Text(
                '연차 기간: 2022-12-26 ~ 2023-12-25',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.65),
              child: const Text(
                '총: 10일 / 사용: 2일 / 잔여: 8일',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (controller.singleleave) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.65),
                    child: Text(
                      '${controller.leavedate.year}년 ${controller.leavedate.month}월 ${controller.leavedate.day}일',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () => selectDate(),
                      child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                            color: Colors.black.withOpacity(0.65),
                          ),
                          child: Text(
                            '날짜수정',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))),
                ],
              ),
            ] else ...[
              GestureDetector(
                  onTap: () => selectDate(),
                  child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: Colors.purpleAccent),
                      child: Text('날짜선택'))),
            ],
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: "요청완료",
                        content: Column(
                          children: [
                            Text(
                                '${controller.leavedate.month}월 ${controller.leavedate.day}일 \n요청완료'),
                          ],
                        ),
                        textConfirm: '확인',
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                          controller.singleleave = false;
                          Get.back();
                          controller.close();
                        },
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: Colors.purpleAccent),
                        child: Text('요청하기'))),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                    onTap: () => controller.close(),
                    child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: Colors.purpleAccent),
                        child: Text('닫기'))),
              ],
            )
          ],
        ),
      ),
    );
  }

  //휴가리스트
  Widget leavelist() {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.5,
      padding: EdgeInsets.only(left: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                selectlist();
              },
              child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.purpleAccent),
                  child: Text('리스트'))),
          GestureDetector(
              onTap: () => controller.close(),
              child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.purpleAccent),
                  child: Text('닫기'))),
        ],
      ),
    );
  }

  selectlist() {
    return Get.dialog(Material(
      color: Colors.black.withOpacity(0.2),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.w),
              CalendarDatePicker2WithActionButtons(
                  config: CalendarDatePicker2WithActionButtonsConfig(
                    selectedDayHighlightColor: Colors.white.withOpacity(0.5),
                    dayTextStyle: TextStyle(color: Colors.white),
                    weekdayLabelTextStyle: TextStyle(color: Colors.white),
                    controlsTextStyle: TextStyle(color: Colors.white),
                    calendarType: CalendarDatePicker2Type.single,
                    disableModePicker: true,
                    dayBuilder: (
                        {required date,
                        decoration,
                        isDisabled,
                        isSelected,
                        isToday,
                        textStyle}) {
                      return GestureDetector(
                        onTap: () => controller.test = date,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${date.day}',
                                style: TextStyle(color: Colors.white),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 2.w,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  value: [],
                  onValueChanged: (dates) {
                    controller.leavedate = dates[0]!;
                  },
                  onOkTapped: () {
                    Get.back();
                  },
                  onCancelTapped: () {
                    Get.back();
                  }),
              SizedBox(height: 10.w),
              Text('${controller.test}'),
            ],
          ),
        ),
      ),
    ));
  }

  selectDate() {
    return Get.bottomSheet(Material(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.w),
              CalendarDatePicker2WithActionButtons(
                  config: CalendarDatePicker2WithActionButtonsConfig(
                    calendarType: CalendarDatePicker2Type.single,
                    disableModePicker: true,
                  ),
                  value: [],
                  onValueChanged: (dates) {
                    controller.leavedate = dates[0]!;
                  },
                  onOkTapped: () {
                    Get.back();
                    controller.singleleave = true;
                  },
                  onCancelTapped: () {
                    Get.back();
                  }),
              SizedBox(height: 10.w),
            ],
          ),
        ),
      ),
    ));
  }
}
