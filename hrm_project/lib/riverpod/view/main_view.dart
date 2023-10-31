import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/constant/app_utils.dart';
import 'package:hrm_project/riverpod/viewmodel/next_home_match_notifier.dart';
import 'package:hrm_project/riverpod/view/second_view.dart';


class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainView();
}

class _MainView extends ConsumerState {
  @override
  void initState() {
    super.initState();
    ref.read(nextHomeMatchProvier.notifier).initData();
  }

  @override
  Widget build(BuildContext context) {
    int dataLength = ref.watch(nextHomeMatchProvier).length;
    int index = re
    print('dataLength : ${dataLength}');
    return dataLength == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('메인화면'),
            ),
            body: Center(
              child: Column(
                children: [
                  Text('helo wolrd :::  ${dataLength}'),
                  ElevatedButton(
                      onPressed: () {
                        AppUtils.gotoPage(context, SecondView());
                      },
                      child: Text('go to secondView')),
                ],
              ),
            ),
          );
  }
}
