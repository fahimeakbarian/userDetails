import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:user_details/Core/Utils/enums.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/Core/network/network_info.dart';

mixin HelperRepository {
  Future<Either<Failure, dynamic>> handlerRepository(
      {required Future<dynamic> Function() remoteFunction,
        Future<dynamic> Function()? localFunction}) async {
    NetworkInfo networkInfo = NetworkInfoImpl();
    // if (await networkInfo.isConnected) {
    if (true) {
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
    } else {
      if (localFunction != null) {
        try {
          final localFunc = await localFunction();
          return Right(localFunc);
        } catch (e) {
          return Left(Failure(message: e.toString()));
        }
      } else {
        return const Left(
            Failure(message: 'LocalDataSource   Not implemented '));
      }
    }
  }
}
