import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

enum ErrorType { socketException, formatException, networkException }

class Failure extends Equatable implements Exception {
  const Failure(
      {this.message, this.type,
        //this.networkException,
        this.dioException});

  factory Failure.networkException(
      {required ErrorType type,
       // required ApiResponse networkException,
        required String message}) {
    return Failure(
        message: message,
        type: ErrorType.networkException,
        //networkException: networkException
    );
  }

  final String? message;
  final ErrorType? type;
  //final ApiResponse? networkException;
  final DioException? dioException;

  @override
  String toString() {
    return 'Failure{message: $message, type: $type, '
        // 'dioException: $networkException}'
    ;
  }

  @override
  List<Object?> get props => [message, type,
    //networkException
    dioException];
}
