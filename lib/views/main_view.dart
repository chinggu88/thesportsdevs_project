import 'package:flutter/material.dart';
import 'package:hrm_project/app_utils.dart';
import 'package:hrm_project/views/second_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인화면'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('helo wolrd'),
            ElevatedButton(
                onPressed: () {
                  AppUtils().gotoPage(context, SecondView());
                },
                child: Text('go to secondView')),
          ],
        ),
      ),
    );
  }
}
