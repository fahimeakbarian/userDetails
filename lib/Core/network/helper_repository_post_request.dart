import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:user_details/Core/Utils/enums.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/Core/network/network_info.dart';
import 'package:user_details/Core/service-locator/service_locator.dart';

mixin HelperRepositoryPostRequest {
  Future<Either<Failure, dynamic>> handlerRepositoryPostRequest({
    required Future<dynamic> Function() remoteFunction,
  }) async {
    NetworkInfo networkInfo = getIt<NetworkInfo>();
    if (await networkInfo.isConnected) {
      try {
        var responseRemoteFunc = await remoteFunction();

        return Right(responseRemoteFunc);
      } catch (e, stackTrace) {
        debugPrint('*** handlerRepository: $e' '\n' 'stackTrace: $stackTrace ');
        debugPrint(' *** $e');
        if (e is Failure) {
          return Left(e);
        } else {
          return Left(
              Failure(message: e.toString(), type: ErrorType.formatException));
        }
      }
    } else {
      return Left(Failure(
          message: 'NetWork Conection',
          type: ErrorType.socketException));
    }
  }
}
