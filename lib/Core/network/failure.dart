import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:user_details/Core/Utils/enums.dart';

class Failure extends Equatable implements Exception {
  const Failure({this.message, this.type, this.dioException});

  factory Failure.networkException(
      {required ErrorType type, required String message}) {
    return Failure(
      message: message,
      type: ErrorType.networkException,
    );
  }

  final String? message;
  final ErrorType? type;
  final DioException? dioException;

  @override
  String toString() {
    return 'Failure{message: $message, type: $type, ';
  }

  @override
  List<Object?> get props => [message, type, dioException];
}
