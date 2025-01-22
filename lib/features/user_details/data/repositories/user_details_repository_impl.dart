import 'package:dartz/dartz.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/Core/network/helper_repository_get_request_.dart';
import 'package:user_details/Core/network/helper_repository_post_request.dart';
import 'package:user_details/Core/service-locator/service_locator_imports.dart';
import 'package:user_details/features/user_details/data/models/user_details_model.dart';
import 'package:user_details/features/user_details/domain/entities/user_details_entity.dart';


class UserDetailsRepositoryImpl with HelperRepositoryGetRequest,
    HelperRepositoryPostRequest
    implements UserDetailsRepository {
  UserDetailsRepositoryImpl({
    required this.remoteDataSource,
     required this.localDataSource,
  });

  final UserDetailsRepositoryRemoteDataSource remoteDataSource;
  final UserDetailsLocalDataSource localDataSource;



  @override
  Future<Either<Failure, UserDetailsEntity>> getUserDetails() async  {
    Either<Failure, dynamic> response =
        await handlerRepositoryGetRequest(remoteFunction: () async {
      UserDetailsModel userDetailsInfoApi =
      await remoteDataSource.getUserDetails();

      localDataSource.cacheUserDetails(userDetailsInfoApi);

      UserDetailsEntity userDetails=userDetailsInfoApi;
      return userDetails;
    },localFunction: ()async {
          UserDetailsModel cachedUser= await localDataSource.getUserDetails();
          return cachedUser;
        });
    var castedResponse =
    response.bimap<Failure, UserDetailsEntity>((l) => l, (r) => r as UserDetailsEntity);
    return castedResponse;
  }

  @override
  Future<Either<Failure, bool>> submitUserPhone(UserParams param) async  {
    Either<Failure, dynamic> response =
        await handlerRepositoryPostRequest(remoteFunction: () async {
      bool submitSucess =
      await remoteDataSource.submitUserPhone(param);
      return submitSucess;
    });
    var castedResponse =
    response.bimap<Failure, bool>((l) => l, (r) => r as bool);
    return castedResponse;
  }
}