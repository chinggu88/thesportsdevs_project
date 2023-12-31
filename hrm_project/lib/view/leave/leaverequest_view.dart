import 'dart:developer';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/constant/function.dart';
import 'package:hrm_project/constant/screen.dart';
import 'package:hrm_project/controller/app_contoller.dart';
import 'package:hrm_project/controller/workation_controller.dart';
import 'package:hrm_project/model/vacation.dart';

import 'package:table_calendar/table_calendar.dart';

class leaverequest_view extends GetView<workationcontroller> {
  leaverequest_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '연차신청',
          style: TextStyle(color: Colors.black87),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.w),
        child: SizedBox(
          width: Get.size.width,
          height: Get.size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.w,
                      ),
                      leavetype(),
                      Obx(
                        () {
                          return controller.selecttype.contains('일차')
                              ? leavetime()
                              : leavedate();
                        },
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  confirm();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.size.width,
                  height: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Text(
                    '신청',
                    style: TextStyle(
                      fontSize: 15.w,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///연차종류
  Obx leavetype() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '연차종류',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              items: controller.types
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: controller.selecttype,
              onChanged: (value) {
                if (value != null) {
                  controller.selecttype = value;
                  log(controller.selecttype);
                }
              },
              buttonStyleData: ButtonStyleData(
                height: 30.w,
                width: 100.w,
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                ),
                elevation: 0,
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.black87,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200.w,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: Colors.white,
                ),
                offset: Offset(0, -5.w),
                scrollbarTheme: ScrollbarThemeData(
                  radius: Radius.circular(40.w),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ],
      );
    });
  }

  Obx leavedate() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '날짜선택',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.w),
          TableCalendar(
            focusedDay: controller.focusdate,
            firstDay: DateTime.now(),
            lastDay: DateTime(DateTime.now().year, 12, 31),
            onDaySelected: (selectedDay, focusedDay) {
              controller.focusdate = focusedDay;
              log('asdf ${selectedDay} == ${controller.focusdate}');
            },
            selectedDayPredicate: ((day) {
              return day == controller.focusdate;
            }),
            headerVisible: false,
          ),
        ],
      );
    });
  }

  Obx leavetime() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '시간',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            child: Row(children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: controller.shour
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ))
                      .toList(),
                  value: controller.selectShours,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectShours = value;
                      log(controller.selectShours);
                    }
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 30.w,
                    width: 40.w,
                    elevation: 0,
                  ),
                  iconStyleData: const IconStyleData(
                    iconSize: 0,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200.w,
                    width: 50.w,
                    offset: Offset(0, -5.w),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40.w),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
              const Text(
                ' : ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: controller.sminute
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ))
                      .toList(),
                  value: controller.selectSminute,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectSminute = value;
                    }
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 30.w,
                    width: 40.w,
                    elevation: 0,
                  ),
                  iconStyleData: const IconStyleData(
                    iconSize: 0,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200.w,
                    width: 50.w,
                    offset: Offset(0, -5.w),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40.w),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
              const Text(
                '~',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: controller.ehour
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ))
                      .toList(),
                  value: controller.selectEhours,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectEhours = value;
                      log(controller.selectEhours);
                    }
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 30.w,
                    width: 50.w,
                    elevation: 0,
                  ),
                  iconStyleData: const IconStyleData(
                    iconSize: 0,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200.w,
                    width: 50.w,
                    offset: Offset(0, -5.w),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40.w),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
              const Text(
                ' : ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: controller.eminute
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ))
                      .toList(),
                  value: controller.selectEminute,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectEminute = value;
                      log(controller.selectEhours);
                    }
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 30.w,
                    width: 40.w,
                    elevation: 0,
                  ),
                  iconStyleData: const IconStyleData(
                    iconSize: 0,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200.w,
                    width: 50.w,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(5.w),
                    //   color: Colors.white,
                    // ),
                    offset: Offset(0, -5.w),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40.w),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            ]),
          )
        ],
      );
    });
  }

  Future<void> confirm() {
    return showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 200.w,
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Text('연차신청'),
                  Text('연차 종류 : ${controller.selecttype}'),
                  Text('연차 시간 : ${controller.focusdate}'),
                  Text('연차 소진 : 60분'),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.leaveslist.insert(
                                0,
                                Vacation.fromJson({
                                  'name': '이강훈',
                                  'vacationType': '${controller.selecttype}',
                                  'startDay':
                                      '${controller.focusdate.year}-${controller.focusdate.month}-${controller.focusdate.day}',
                                  'endDay':
                                      '${controller.focusdate.year}-${controller.focusdate.month}-${controller.focusdate.day}',
                                  'startTime':
                                      '${controller.selectShours}:${controller.selectSminute}',
                                  'endTime':
                                      '${controller.selectEhours}:${controller.selectEminute}',
                                  'approve': false,
                                  'insertdate': '${DateTime.now()}'
                                }));
                            controller.countholdleaves();
                            Get.back();
                            Get.back();
                          },
                          child: Text('확인')),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('취소'))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
