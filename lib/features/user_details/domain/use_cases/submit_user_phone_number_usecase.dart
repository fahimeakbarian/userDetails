import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/Core/usecase/usecase.dart';
import 'package:user_details/features/user_details/domain/repositories/user_details_repository.dart';

class SubmitUserPhoneNumberUseCase implements UseCase<bool, UserParams> {
  SubmitUserPhoneNumberUseCase({required this.repository});

  final UserDetailsRepository repository;

  @override
  Future<Either<Failure, bool>> call(UserParams params) async {
    return await repository.submitUserPhone(params);
  }

}

class UserParams extends Equatable {

  const UserParams({required this.phoneNumber});
  final  String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];

  Map<String, dynamic> toJson() {
    return {
      'phone': phoneNumber,
      //add name as fix name
      'name': 'John Doe',
    };
  }
}