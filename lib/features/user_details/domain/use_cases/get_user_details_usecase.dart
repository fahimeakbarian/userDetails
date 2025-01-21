import 'package:dartz/dartz.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/Core/usecase/usecase.dart';
import 'package:user_details/features/user_details/domain/entities/user_details_entity.dart';
import 'package:user_details/features/user_details/domain/repositories/user_details_repository.dart';

class GetUserDetails implements UseCase<UserDetailsEntity, NoParams?> {
  GetUserDetails({required this.repository});

  final UserDetailsRepository repository;

  @override
  Future<Either<Failure, UserDetailsEntity>> call(NoParams? params) async {
       return  await repository.getAllUserDetails();
  }

}