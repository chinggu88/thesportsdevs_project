import 'dart:developer';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/constant/screen.dart';
import 'package:hrm_project/controller/app_contoller.dart';
import 'package:hrm_project/controller/workation_controller.dart';

import 'package:table_calendar/table_calendar.dart';

class workation_view extends GetView<workationcontroller> {
  workation_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.w),
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
                      height: 40.w,
                    ),
                    state(),
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
              onTap: () {},
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
    );
  }

  Obx state() {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${AppController.to.user.toJson()}님 \n남은연차는 ${AppController.to.user}일 입니다.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
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
}
