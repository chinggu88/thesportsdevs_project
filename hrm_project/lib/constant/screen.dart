import 'dart:ui';

import 'package:get/get.dart';

class ScreenUtil {
  static final ScreenUtil _screenUtil = ScreenUtil._internal();

  factory ScreenUtil() {
    return _screenUtil;
  }
  ScreenUtil._internal();

  Size defaultsize = const Size(375, 812);

  ///기본사이즈 설정
  setScreen(Size value) => defaultsize = value;

  ///가로비율
  double get ratiow => Get.size.width / defaultsize.width;

  ///세로비율
  double get ratioh => Get.size.height / defaultsize.height;

  ///텍스트비율(가로기준)
  double setSw(num fontSize) => fontSize * ratiow;

  ///텍스트비율(세로기준)
  double setSh(num fontSize) => fontSize * ratioh;

  ///세로비율
  // double seth(num fontSize) => fontSize * ratiow;
  double seth(num height) => height * ratioh;

  ///가로비율
  double setw(num width) => width * ratiow;
}

extension SizeExtension on num {
  double get sw => ScreenUtil().setSw(this);
  double get sh => ScreenUtil().setSh(this);
  double get w => ScreenUtil().setw(this);
  double get h => ScreenUtil().seth(this);
}
