import 'package:dio/dio.dart';
import 'package:teste_apod/app/core/utils/app_global_variables.dart';

class AppClient {
  late Dio _dio;

  AppClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppGlobalVariables.apiUrl,
        queryParameters: {'api_key': AppGlobalVariables.apiKey},
      ),
    );
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, queryParameters: queryParameters);

    // if (result.statusCode == 200) {
    //   return result;
    // } else {
    //   throw result.statusMessage ?? 'Ocorreu um erro';
    // }
  }
}
