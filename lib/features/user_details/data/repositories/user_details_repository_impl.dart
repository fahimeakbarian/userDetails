import 'package:dartz/dartz.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/Core/network/repository_helper.dart';
import 'package:user_details/features/user_details/data/data_sources/remote_data_source/user-details_remote-data_source.dart';
import 'package:user_details/features/user_details/domain/entities/user_details_entity.dart';
import 'package:user_details/features/user_details/domain/repositories/user_details_repository.dart';

class UserDetailsRepositoryImpl with HelperRepository implements UserDetailsRepository {
  UserDetailsRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
  });

  final UserDetailsRepositoryRemoteDataSource remoteDataSource;



  @override
  Future<Either<Failure, UserDetailsEntity>> getAllUserDetails() async  {
    Either<Failure, dynamic> response =
        await handlerRepository(remoteFunction: () async {
      UserDetailsEntity userDetailsInfoApi =
      await remoteDataSource.getAllUserDetails();
      return userDetailsInfoApi;
    });
    var castedResponse =
    response.bimap<Failure, UserDetailsEntity>((l) => l, (r) => r as UserDetailsEntity);
    return castedResponse;
  }
}