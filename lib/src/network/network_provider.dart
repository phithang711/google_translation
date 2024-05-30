import 'package:dio/dio.dart';
export 'package:dio/dio.dart';

Dio _initDio() {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor());
  return dio;
}

final Dio api = _initDio();
