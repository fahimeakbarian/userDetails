import 'package:user_details/Core/Utils/config.dart';
import 'package:user_details/Core/network/dio_request_manager.dart';
import 'package:user_details/features/user_details/data/models/user_details_model.dart';

abstract class UserDetailsRepositoryRemoteDataSource {
  Future<UserDetailsModel> getAllUserDetails();
}

class UserDetailsRemoteDataSourceImpl implements UserDetailsRepositoryRemoteDataSource {
  UserDetailsRemoteDataSourceImpl({required this.requestManager});

  final DioRequestManager requestManager;

  @override
  Future<UserDetailsModel> getAllUserDetails() async {
    UserDetailsModel userDetailsResult = await requestManager
        .apiCall(
      requestType: 'GET',
      url: Config.apiUrl,
      // queryParameters: params?.toJson()
    )
        .then((value) => UserDetailsModel.fromJson(value.data['result']));
    return userDetailsResult;
  }
}