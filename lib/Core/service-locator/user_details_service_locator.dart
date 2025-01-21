part of 'service_locator.dart';


userDetailsServiceLocator() {
  // getIt.registerLazySingleton<UserDetailsRepositoryRemoteDataSource>(() =>
  //     UserDetailsRemoteDataSourceImpl(
  //         requestManager: getIt<DioRequestManager>()));
  //
  // getIt.registerLazySingleton<UserDetailsRepositoryLocalDataSource>(
  //         () => UserDetailsLocalDataSourceImpl());
  //
  // getIt.registerLazySingleton<UserDetailsRepository>(() =>
  //     UserDetailsRepositoryImp(
  //         remoteDataSource: getIt<UserDetailsRepositoryRemoteDataSource>(),
  //         localDataSource: getIt<UserDetailsRepositoryLocalDataSource>()));
  //
  // getIt.registerLazySingleton<ConcreteUserDetails>(() =>
  //     ConcreteUserDetails(
  //         repository: getIt<UserDetailsRepository>(),
  //         categoriesRepository: getIt<CategoriesRepository>()));
  //
  // getIt.registerFactory<CategoryUserDetailsBloc>(() =>
  //     CategoryUserDetailsBloc(concrete: getIt<ConcreteUserDetails>()));
  //
  // getIt.registerFactory<RegisterNewUserDetailsBloc>(() =>
  //     RegisterNewUserDetailsBloc(concrete: getIt<ConcreteUserDetails>()));
  // // );
  // getIt.registerFactory<YoursUserDetailsBloc>(
  //       () => YoursUserDetailsBloc(concrete: getIt<ConcreteUserDetails>()),
  //);
}
