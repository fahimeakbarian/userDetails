import 'package:user_details/Core/service-locator/service_locator_imports.dart';

part 'user_details_service_locator.dart';

GetIt getIt = GetIt.I;

setUpServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  final connectionChecker = InternetConnectionChecker.instance;
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => connectionChecker);

  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(connectionChecker: getIt<InternetConnectionChecker>()));

  getIt.registerSingleton<DioRequestManager>(DioRequestManager());

  userDetailsServiceLocator();
}
