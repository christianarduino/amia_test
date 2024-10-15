import 'package:amia/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Dio configureDioClient() {
  final dio = Dio(BaseOptions(baseUrl: dogApi));

  dio.interceptors.add(LogInterceptor());

  return dio;
}

final dioProvider = Provider<Dio>((ref) {
  final dioClient = configureDioClient();
  return dioClient;
});
