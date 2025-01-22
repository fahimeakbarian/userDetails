import 'package:user_details/Core/Utils/config.dart';
import 'package:user_details/Core/service-locator/service_locator_imports.dart';
import 'package:user_details/features/user_details/data/models/user_details_model.dart';

abstract class UserDetailsRepositoryRemoteDataSource {
  Future<UserDetailsModel> getUserDetails();
  Future<bool> submitUserPhone(UserParams userParam);
}

class UserDetailsRemoteDataSourceImpl
    implements UserDetailsRepositoryRemoteDataSource {
  UserDetailsRemoteDataSourceImpl({required this.requestManager});

  final DioRequestManager requestManager;

  @override
  Future<UserDetailsModel> getUserDetails() async {
    UserDetailsModel userDetailsResult = await requestManager
        .apiCall(
          requestType: 'GET',
          url: Config.apiUrlGetUser,
          // queryParameters: params?.toJson()
        )
        .then((value) => UserDetailsModel.fromJson(value.data));
    return userDetailsResult;
  }

  @override
  Future<bool> submitUserPhone(UserParams userParam) async {
    try{
         await requestManager
          .apiCall(
        requestType: 'POST',
        url: Config.apiUrlPostUser,
        data:userParam.toJson()
      );
      return  true;
    }catch (e){
      return false;
    }

  }
}
