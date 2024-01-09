import 'package:dio/dio.dart';

import 'interceptor.dart';

Dio getDio() {
  Dio dio = Dio();

  dio.interceptors.add(AppInterceptor());

  return dio;
}