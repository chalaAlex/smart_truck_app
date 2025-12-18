import 'package:smart_truck_app/app/app_preferences.dart';
import 'package:smart_truck_app/data/data_source/local_data_source.dart';
import 'package:smart_truck_app/data/data_source/remote_data_source.dart';
import 'package:smart_truck_app/data/network/network_info.dart';
import 'package:smart_truck_app/domain/repository/repository.dart';

class RepositoryImpelementor extends Repository {
  RepositoryImpelementor(
    this._remoteDataSource,
    this._networkInfo,
    this._localDataSource,
    this._appPreferences,
  );

  LocalDataSource _localDataSource;
  NetworkInfo _networkInfo;
  RemoteDataSource _remoteDataSource;
  AppPreferences _appPreferences;
}
