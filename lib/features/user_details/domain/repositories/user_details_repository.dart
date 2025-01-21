

import 'package:dartz/dartz.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/features/user_details/domain/entities/user_details_entity.dart';

abstract class UserDetailsRepository {
  Future<Either<Failure, UserDetailsEntity>> getAllUserDetails();
}