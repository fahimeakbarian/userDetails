import 'package:dartz/dartz.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/Core/usecase/usecase.dart';
import 'package:user_details/features/user_details/domain/repositories/user_details_repository.dart';

class SubmitUserPhoneNumberUseCase implements UseCase<void, NoParams?> {
  SubmitUserPhoneNumberUseCase({required this.repository});

  final UserDetailsRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams? params) async {
    return await repository.getAllUserDetails();
  }
}
