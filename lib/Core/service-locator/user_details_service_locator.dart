part of 'service_locator.dart';

userDetailsServiceLocator() {
  getIt.registerLazySingleton<UserDetailsRepositoryRemoteDataSource>(() =>
      UserDetailsRemoteDataSourceImpl(
          requestManager: getIt<DioRequestManager>()));

  getIt.registerLazySingleton<UserDetailsLocalDataSource>(() =>
      UserDetailsLocalDataSourceImpl(
          sharedPreferences: getIt<SharedPreferences>()));

  getIt.registerLazySingleton<UserDetailsRepository>(() =>
      UserDetailsRepositoryImpl(
          remoteDataSource: getIt<UserDetailsRepositoryRemoteDataSource>(),
          localDataSource: getIt<UserDetailsLocalDataSource>()));

  getIt
      .registerLazySingleton<GetUserDetailsUseCase>(() => GetUserDetailsUseCase(
            repository: getIt<UserDetailsRepository>(),
          ));
  getIt.registerLazySingleton<SubmitUserPhoneNumberUseCase>(
      () => SubmitUserPhoneNumberUseCase(
            repository: getIt<UserDetailsRepository>(),
          ));

  getIt.registerFactory<UserDetailsCubit>(() => UserDetailsCubit(
        getUserDetailsUseCase: getIt<GetUserDetailsUseCase>(),
        submitUserPhoneNumberUseCase: getIt<SubmitUserPhoneNumberUseCase>(),
      ));
}
