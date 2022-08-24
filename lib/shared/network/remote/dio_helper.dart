//https://newsapi.org/
//v2/top-headlines?
//country=us&category=business&apiKey=b3c089b504424ddcb6035df0f7900399

import 'dart:ffi';

import 'package:dio/dio.dart';

//ToDo: Continuo Dio HElper

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio?.get(
      url,
      queryParameters: query,
    );
  }
}
