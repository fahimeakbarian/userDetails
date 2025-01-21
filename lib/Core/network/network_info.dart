import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:user_details/Core/network/failure.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl();

  final connectionChecker = InternetConnectionChecker.instance;

  @override
  Future<bool> get isConnected async {
    try {
      final bool isConnected =
          await InternetConnectionChecker.instance.hasConnection;
      return isConnected;
    } on PlatformException catch (e, stackTrace) {
      // log(e.message.toString(), stackTrace: stackTrace);
      throw Failure(
          message: 'checkConnectivity hase error' '${e.message.toString()}');
    }
  }
}
