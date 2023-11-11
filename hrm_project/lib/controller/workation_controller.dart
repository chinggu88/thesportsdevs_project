import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_project/constant/dio_helper.dart';
import 'package:hrm_project/model/playerinfo.dart';
import 'package:hrm_project/model/vacation.dart';

class workationcontroller extends GetxController {
  static workationcontroller get to => Get.find();

  final _playerlist = <PlayerInfo>[].obs;

  ///List<Playerinfo> class
  List<PlayerInfo> get playerlist => _playerlist;
  set playerlist(List<PlayerInfo> value) {
    _playerlist.clear();
    _playerlist.addAll(value);
  }

  final _types = ['연차', '오후반차', '오전반차', '일차', '교육 및 훈련', '공가', '병가'].obs;

  ///연차종류
  List<String> get types => _types;
  set types(List<String> value) {
    _types.clear();
    _types.addAll(value);
  }

  final _selecttype = '연차'.obs;

  ///연차 선택 값
  String get selecttype => _selecttype.value;
  set selecttype(String value) => _selecttype.value = value;

  final _shour = <String>[].obs;

  ///휴가시작시간(시)
  List<String> get shour => _shour;
  set shour(List<String> value) {
    _shour.clear();
    _shour.addAll(value);
  }

  final _sminute = <String>[].obs;

  ///휴가시작시간(분)
  List<String> get sminute => _sminute;
  set sminute(List<String> value) {
    _sminute.clear();
    _sminute.addAll(value);
  }

  final _ehour = <String>[].obs;

  ///휴가마지막시간(시)
  List<String> get ehour => _ehour;
  set ehour(List<String> value) {
    _ehour.clear();
    _ehour.addAll(value);
  }

  final _eminute = <String>[].obs;

  ///휴가마지막시간(분)
  List<String> get eminute => _eminute;
  set eminute(List<String> value) {
    _eminute.clear();
    _eminute.addAll(value);
  }

  final _selectShours = '09'.obs;

  ///연차 시작 시간
  String get selectShours => _selectShours.value;
  set selectShours(String value) => _selectShours.value = value;

  final _selectSminute = '00'.obs;

  ///연차 시작 분
  String get selectSminute => _selectSminute.value;
  set selectSminute(String value) => _selectSminute.value = value;

  final _selectEhours = '09'.obs;

  ///연차 시작 시간
  String get selectEhours => _selectEhours.value;
  set selectEhours(String value) => _selectEhours.value = value;

  final _selectEminute = '00'.obs;

  ///연차 시작 분
  String get selectEminute => _selectEminute.value;
  set selectEminute(String value) => _selectEminute.value = value;

  final _focusdate = DateTime.now().obs;

  ///휴가날자
  DateTime get focusdate => _focusdate.value;
  set focusdate(DateTime value) => _focusdate.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initdata();
  }

  void initdata() {
    shour.clear();
    ehour.clear();
    sminute.clear();
    ehour.clear();
    _selecttype.value = '연차';
    for (int i = 0; i < 24; i++) {
      if (i < 10) {
        shour.add('0$i');
        ehour.add('0$i');
      } else {
        shour.add('$i');
        ehour.add('$i');
      }
    }
    for (int i = 0; i < 6; i++) {
      if (i == 0) {
        sminute.add('00');
        eminute.add('00');
      } else {
        sminute.add('${i * 10}');
        eminute.add('${i * 10}');
      }
    }
  }
}
