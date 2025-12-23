import 'package:smart_truck_app/core/network/app_api.dart';

abstract class RemoteDataSource {}

class RemoteDataSourceImplementor implements RemoteDataSource {
  RemoteDataSourceImplementor(this._appServiceClient);

  AppServiceClient _appServiceClient;
}
