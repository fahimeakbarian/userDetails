

import 'package:dartz/dartz.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/features/user_details/domain/entities/user_details_entity.dart';
import 'package:user_details/features/user_details/domain/use_cases/submit_user_phone_number_usecase.dart';

abstract class UserDetailsRepository {
  Future<Either<Failure, UserDetailsEntity>> getUserDetails();
  Future<Either<Failure, bool>>  submitUserPhone(UserParams param);
}