import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/constant/dio_helper.dart';
import 'package:hrm_project/model/playerinfo.dart';
import 'package:o3d/o3d.dart';

class workationcontroller extends GetxController {
  static workationcontroller get to => Get.find();

  final _playerlist = <PlayerInfo>[].obs;

  ///List<Playerinfo> class
  List<PlayerInfo> get playerlist => _playerlist;
  set playerlist(List<PlayerInfo> value) {
    _playerlist.clear();
    _playerlist.addAll(value);
  }

  final _pagelist = 2.obs;

  ///List<Playerinfo> class
  int get pagelist => _pagelist.value;
  set pagelist(int value) => _pagelist.value = value;

  final _pageindex = 1.obs;

  ///List<Playerinfo> class
  int get pageindex => _pageindex.value;
  set pageindex(int value) => _pageindex.value = value;

  final _leavedate = DateTime.now().obs;

  ///단일 휴가
  DateTime get leavedate => _leavedate.value;
  set leavedate(DateTime value) => _leavedate.value = value;

  final _singleleave = false.obs;

  ///단일 날짜 선택 유무
  bool get singleleave => _singleleave.value;
  set singleleave(bool value) => _singleleave.value = value;

  final _test = DateTime.now().obs;

  ///test
  DateTime get test => _test.value;
  set test(DateTime value) => _test.value = value;

  O3DController o3d = O3DController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // /v3/game/playerList?gameSearch.position=포
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    // final res =
    //     await DioHelper.kgetApi('/v3/game/playerList?gameSearch.position=포');
    // res.data['body']['itemList'].forEach((e) {
    //   PlayerInfo temp = PlayerInfo.fromJson(e as Map<String, dynamic>);
    //   log('${e as Map<String, dynamic>}');
    //   _playerlist.add(temp);
    // });
  }

  void initleave() {
    _singleleave.value = false;
  }

  void startleave() {
    _pageindex.value = 2;
    o3d.cameraTarget(0.1, -1.7, -8);
  }

  void startleavelist() {
    _pageindex.value = 3;
    o3d.cameraTarget(-2.2, -1, -8);
  }

  void close() {
    _pageindex.value = 1;
    o3d.cameraTarget(0, 0, 0);
  }
}
