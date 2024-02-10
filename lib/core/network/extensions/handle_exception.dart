import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../models/error_handler.dart';
import '../models/failure.dart';

extension ExceptionHandling on Future<dynamic> {
  Future<Either<Failure, dynamic>> onResult(
  ) async {
    try {
      final response = await this;
      return Right(response);
    } catch (error) {
      debugPrint("ExceptionHandling :: catch" + error.toString());
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}