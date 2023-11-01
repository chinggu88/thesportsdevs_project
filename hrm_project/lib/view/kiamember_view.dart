import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/controller/kiamember_controller.dart';

class KiaMemberView extends GetView<kiamembercontroller> {
  const KiaMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KiaMember'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('kia'),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
          players(),
        ],
      )),
    );
  }

  Obx players() {
    return Obx(() {
      return controller.playerlist.isEmpty
          ? Container(
              child: Text('선수가 없습니다.'),
            )
          : Column(
              children: [
                for (var i in controller.playerlist) ...[Text('${i.nAME}')]
              ],
            );
    });
  }
}
