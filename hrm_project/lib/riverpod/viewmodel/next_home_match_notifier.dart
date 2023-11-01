import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/constant/dio_helper.dart';
import 'package:hrm_project/model/next_home_match_item.dart';

// state = List<NextHomeMatchItem>
final nextHomeMatchProvier =
    StateNotifierProvider<NextHomeMatchNotifier, List<NextHomeMatchItem>>(
        (ref) => NextHomeMatchNotifier());

class NextHomeMatchNotifier extends StateNotifier<List<NextHomeMatchItem>> {
  NextHomeMatchNotifier() : super([]);

  initData() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000), () {
        print('딜레이 : ${state.length}');
      });
      print('데이터 호출');

      Response response = await DioHelper.getApi('/nav/next_home_match');
      NextHomeMatchList nextHomeMatchList =
          NextHomeMatchList.fromJson(response.data);
      state = nextHomeMatchList.data as List<NextHomeMatchItem>;
      log('NextHomeMatchList data received : ${state.length}');
    } catch (e) {
      log('NextHomeMatchList data Error', error: e);
    }
  }
}
