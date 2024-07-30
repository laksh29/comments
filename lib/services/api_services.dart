import 'dart:developer';

import 'package:dio/dio.dart' as dio;

class ApiError {
  final String message;
  final int code;

  ApiError({
    required this.code,
    required this.message,
  });

  factory ApiError.fromResponse(dio.Response rawResponse) {
    Map<String, dynamic> response = Map<String, dynamic>.from(rawResponse.data);
    return ApiError(
      code: rawResponse.statusCode!,
      message: response['message'].runtimeType == List
          ? response['message'][0]
          : response['message'].toString(),
    );
  }
}

class ApiService {
  final dio.Dio _dio = dio.Dio();

  ///GET method for REST API call
  Future<dynamic> apiGet({
    required String apiUrl,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      log("API GET CALL : $apiUrl");

      dio.Response rawResponse = await _dio.get(apiUrl,
          queryParameters: queryParameters,
          options: dio.Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 300;
            },
          ));

      // log("raw response " + rawResponse.toString());
      return rawResponse.data;
    } on dio.DioException catch (e) {
      log("getAPI : ${e.response.toString()} - $apiUrl");
      rethrow;
    }
  }
}
