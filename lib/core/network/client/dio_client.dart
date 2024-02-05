import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/dio_constants.dart';

class DioClient {
  static getInstance() {
    final dio = Dio();

    final defaultHeaders = {
      contentType: applicationJson,
      accept: applicationJson,
      defaultLanguage: defaultLanguage
    };

    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      headers: defaultHeaders,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
