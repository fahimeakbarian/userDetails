
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_details/Core/network/network_info.dart';
import 'package:user_details/Core/service-locator/service_locator_imports.dart';
import 'package:user_details/features/user_details/data/data_sources/local_data_source/user_details_local_data_source.dart';


part 'user_details_service_locator.dart';

GetIt getIt = GetIt.I;

setUpServiceLocator() async {


  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  final connectionChecker = InternetConnectionChecker.instance;
  getIt.registerLazySingleton<InternetConnectionChecker>(() => connectionChecker);

  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(connectionChecker: getIt<InternetConnectionChecker>()
      ));




  getIt.registerSingleton<DioRequestManager>(DioRequestManager());





  userDetailsServiceLocator();
}
