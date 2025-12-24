import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_truck_app/core/app/app_constant.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
}