import 'dart:developer';

import 'package:dio/dio.dart';

class DioHelper {
  DioHelper._();

  /// Todo : 출시 전 개발서버 지워주기 !!
  static final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api-jbhd.thesports.io', // 개발서버
  ));
  static final Dio kdio = Dio(BaseOptions(
    baseUrl: 'https://api-jbhd.thesports.io', // 개발서버
  ));

  static Future<Response> getApi(String url) async {
    Response res;
    try {
      log('[getApi]요청성공 URL : ${dio.options.baseUrl + url}');
      res = await dio.get(url);
    } catch (e) {
      log('', error: '[getApi] ERROR : $e');
      res = Response(
        requestOptions: RequestOptions(),
        statusCode: -999,
      );
    }
    return res;
  }

  static Future<Response> postApi(String url, Map<String, dynamic> body) async {
    Response res;
    try {
      log('[postApi]요청성공 URL : ${url} , param ${body}');
      res = await dio.post(url, data: body);
    } catch (e) {
      log('', error: '[postApi] ERROR : ${e}');
      res = Response(
        requestOptions: RequestOptions(),
        statusCode: -999,
      );
    }
    return res;
  }

  Future<Response> kgetApi(String url) async {
    Response res;
    try {
      res = await kdio.get(url);
    } catch (e) {
      res = Response(
        requestOptions: RequestOptions(),
        statusCode: -999,
      );
    }
    return res;
  }

  static Future<Response> kpostApi(
      String url, Map<String, dynamic> body) async {
    Response res;
    try {
      res = await kdio.post(url, data: body);
    } catch (e) {
      res = Response(
        requestOptions: RequestOptions(),
        statusCode: -999,
      );
    }
    return res;
  }
}



// class DioHelper {
//   /// 일반 http
//   Dio dio = Dio(BaseOptions(
//     baseUrl: 'https://api-jbhd.thesports.io', // 개발서버
//   ));
// }
