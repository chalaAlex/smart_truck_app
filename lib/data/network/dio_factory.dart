import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_truck_app/app/app_constant.dart';
import 'package:smart_truck_app/app/app_preferences.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactoryMethod {
  DioFactoryMethod(this._appPreferences);

  AppPreferences _appPreferences;

  Future<Dio> getDio() async {
    Dio dio = Dio();

    int _timeOut = 60000;
    String token = Constant.token;
    String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: ACCEPT,
       AUTHORIZATION: 'Bearer $token',
      DEFAULT_LANGUAGE: language
    };

    dio.options = BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: Duration(milliseconds: _timeOut),
        receiveTimeout: Duration(milliseconds: _timeOut),
        headers: headers);


    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Ensure we have the latest token
          await Constant.loadToken();
          options.headers[AUTHORIZATION] = 'Bearer ${Constant.token}';
          return handler.next(options);
        },
      ),
    );
    
    if (kReleaseMode) {
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
      
    }

    return dio;
  }
}
