
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_details/Core/Utils/config.dart';
import 'package:user_details/Core/network/failure.dart';
import 'package:user_details/features/user_details/data/models/user_details_model.dart';

abstract class UserDetailsLocalDataSource {

  Future<UserDetailsModel> getUserDetails();

  Future<void> cacheUserDetails(UserDetailsModel userCache);
}



class UserDetailsLocalDataSourceImpl implements UserDetailsLocalDataSource {

  UserDetailsLocalDataSourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<UserDetailsModel> getUserDetails() {
    final jsonString = sharedPreferences.getString(Config.selectedUserKey);
    if (jsonString != null) {
      return Future.value(UserDetailsModel.fromJson(json.decode(jsonString)));
    } else {
      throw Failure(message: 'CacheException');
    }
  }

  @override
  Future<void> cacheUserDetails(UserDetailsModel userCache) {
    return sharedPreferences.setString(
      Config.selectedUserKey,
      json.encode(userCache.toJson()),
    );
  }
}