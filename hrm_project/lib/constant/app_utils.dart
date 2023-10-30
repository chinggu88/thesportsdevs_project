import 'package:flutter/material.dart';

class AppUtils {
  /// 화면 이동
  static void gotoPage(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}

