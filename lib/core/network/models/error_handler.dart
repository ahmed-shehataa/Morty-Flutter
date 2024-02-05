import 'package:dio/dio.dart';
import 'package:morty_flutter/core/network/extensions/data_source_extension.dart';

import '../enums/data_source.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.original.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        return DataSource.noInternetConnection.getFailure();
      case DioExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(error.response?.statusCode ?? 0,
              error.response?.statusMessage ?? "");
        } else {
          return DataSource.original.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      default:
        return DataSource.original.getFailure();
    }
  }
}