import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_truck_app/core/app/app_constant.dart';
import 'package:smart_truck_app/core/app/app_preferences.dart';
import 'package:smart_truck_app/features/freights/data/data_source/local_data_source.dart';
import 'package:smart_truck_app/features/freights/data/data_source/remote_data_source.dart';
import 'package:smart_truck_app/core/network/app_api.dart';
import 'package:smart_truck_app/core/network/dio_factory.dart';
import 'package:smart_truck_app/core/network/network_info.dart';
import 'package:smart_truck_app/features/freights/data/repository/repository_implementor.dart';
import 'package:smart_truck_app/features/freights/domain/repository/repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  await Constant.loadToken();

  // shared refs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance()),
  );

  // network info
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementor(DataConnectionChecker()),
  );

  // dio factory
  instance.registerLazySingleton<DioFactoryMethod>(() => DioFactoryMethod(instance()));

    // app service client
  final dio = await instance<DioFactoryMethod>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementor(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpelementor(instance(), instance(), instance(), instance()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementor());

      
}
