import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementor implements NetworkInfo {
  NetworkInfoImplementor(this._dataConnectionChecker);

  DataConnectionChecker _dataConnectionChecker;

  @override
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;
}
