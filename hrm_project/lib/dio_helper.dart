import 'package:dio/dio.dart';

/// Todo : 출시 전 개발서버 지워주기 !!

final dio = Dio(BaseOptions(
  baseUrl: 'https://api-jbhd.thesports.io', // 개발서버
));

// class DioHelper {
//   /// 일반 http
//   Dio dio = Dio(BaseOptions(
//     baseUrl: 'https://api-jbhd.thesports.io', // 개발서버
//   ));
// }
