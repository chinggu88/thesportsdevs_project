import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hrm_project/constant/dio_helper.dart';
import 'package:hrm_project/model/playerinfo.dart';

class kiamembercontroller extends GetxController {
  static kiamembercontroller get to => Get.find();

  final _playerlist = <PlayerInfo>[].obs;

  ///List<Playerinfo> class
  List<PlayerInfo> get playerlist => _playerlist;
  set playerlist(List<PlayerInfo> value) {
    _playerlist.clear();
    _playerlist.addAll(value);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log(' kiamembercontroller onInit');
    // /v3/game/playerList?gameSearch.position=포
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    log(' kiamembercontroller onReady');
    final res =
        await DioHelper.kgetApi('/v3/game/playerList?gameSearch.position=포');
    res.data['body']['itemList'].forEach((e) {
      PlayerInfo temp = PlayerInfo.fromJson(e as Map<String, dynamic>);
      log('${e as Map<String, dynamic>}');
      _playerlist.add(temp);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    log(' kiamembercontroller onClose');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    log('kiamembercontroller dispose');
  }
}
