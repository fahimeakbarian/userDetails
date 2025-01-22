import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:user_details/Core/Utils/enums.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/Core/network/network_info.dart';
import 'package:user_details/Core/service-locator/service_locator.dart';

mixin HelperRepositoryGetRequest {
  Future<Either<Failure, dynamic>> handlerRepositoryGetRequest(
      {required Future<dynamic> Function() remoteFunction,
        Future<dynamic> Function()? localFunction
      }) async {
    NetworkInfo networkInfo = getIt<NetworkInfo>();
     if (await networkInfo.isConnected) {
      try {
        var responseRemoteFunc = await remoteFunction();

        return Right(responseRemoteFunc);
      } catch (e, stackTrace) {
        debugPrint('*** handlerRepository: $e' '\n' 'stackTrace: $stackTrace ');
        debugPrint(' *** ' + e.toString());
        if (e is Failure) {
          return Left(e);
        } else {
          return Left(
              Failure(message: e.toString(), type: ErrorType.formatException));
        }
      }
    } else
    {
      if (localFunction != null) {
        try {
          final localFunc = await localFunction();
          return Right(localFunc);
        } catch (e) {
          return Left(Failure(message: e.toString()));
        }
      }
      else {
        return const Left(
            Failure(message: 'LocalDataSource   Not implemented '));
      }
    }
  }
}
