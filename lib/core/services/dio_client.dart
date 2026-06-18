import 'package:dio/dio.dart';
import 'package:mymovies/core/config/api_config.dart';


class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Authorization': 'Bearer ${ApiConfig.bearerToken}',
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
