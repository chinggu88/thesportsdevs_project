import 'package:flutter/material.dart';
import 'package:hrm_project/constant/app_utils.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondView'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('SecondView helo wolrd'),
          ],
        ),
      ),
    );
  }
}
