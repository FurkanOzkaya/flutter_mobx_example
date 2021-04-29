import 'package:dio/dio.dart';

class BaseApiClient {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  late Dio _dio;

  BaseApiClient._privateConstructor() {
    _dio = Dio();
  }

  static final BaseApiClient _instance = BaseApiClient._privateConstructor();

  static BaseApiClient get instance => _instance;

  Dio get getClient => _dio;
}
