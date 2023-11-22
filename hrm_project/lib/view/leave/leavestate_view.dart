import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/constant/function.dart';
import 'package:hrm_project/constant/screen.dart';
import 'package:hrm_project/controller/app_contoller.dart';
import 'package:hrm_project/controller/workation_controller.dart';

class leavestate_view extends GetView<workationcontroller> {
  const leavestate_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: SizedBox(
        width: Get.size.width,
        height: Get.size.height,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state(),
                      SizedBox(width: 10.w),
                      earlyleaves(),
                      SizedBox(width: 10.w),
                      holdleaves()
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: listview()),
            GestureDetector(
              onTap: () {
                Get.toNamed('/test');
              },
              child: Container(
                alignment: Alignment.center,
                width: Get.size.width,
                height: 50.w,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10.w)),
                child: Text(
                  'ai',
                  style: TextStyle(
                    fontSize: 15.w,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/leavsrequest');
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
    );
  }

  Obx state() {
    return Obx(
      () {
        return Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Colors.greenAccent),
          child: Column(
            children: [
              Text(
                '${cal_leavesday(AppController.to.user.leaveminuts!)}d ${cal_leaveshour(AppController.to.user.leaveminuts!)}h ${cal_leavesminute(AppController.to.user.leaveminuts!)}m',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.w),
              Text(
                '남은연차',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Obx earlyleaves() {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            color: Colors.greenAccent),
        child: Column(
          children: [
            Text(
              '${controller.earlyleavs}건',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.w),
            Text(
              '에정연차',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    });
  }

  Obx holdleaves() {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            color: Colors.greenAccent),
        child: Column(
          children: [
            Text(
              '${controller.holdleavs}건',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.w),
            Text(
              '대기연차',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    });
  }

  Obx listview() {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: [
            for (var i in controller.leaveslist) ...[
              if (i.vacationType == '일차') ...[
                SizedBox(height: 10.w),
                Row(
                  children: [
                    Text('${i.vacationType}'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('${i.startDay}'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('${i.startTime}'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('${i.endTime}'),
                    SizedBox(
                      width: 10.w,
                    ),
                    if (i.approve!) ...[Text('승인완료')] else ...[Text('승인대기')]
                  ],
                ),
              ] else ...[
                SizedBox(height: 10.w),
                Row(
                  children: [
                    Text('${i.vacationType}'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('${i.startDay}'),
                    SizedBox(
                      width: 10.w,
                    ),
                    if (i.approve!) ...[Text('승인완료')] else ...[Text('승인대기')]
                  ],
                ),
              ]
            ]
          ],
        ),
      );
    });
  }
}
