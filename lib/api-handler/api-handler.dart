import 'dart:async';
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:rajishthanapp/constant/api_constants.dart';

import 'env_constants.dart';
import 'logging_interceptor.dart';



/// Helper class for configuring Api calls
class ApiBaseHelper {
  Dio? _dio;
  Alice? alice;

  ApiBaseHelper() {
    alice = Alice(showNotification: false);
    var options = BaseOptions(
        receiveTimeout: ApiConstant.TIMEOUT,
        connectTimeout: ApiConstant.TIMEOUT);
    options.baseUrl = EnvironmentConstants.setEnvironment(Environment.DEV);
    _dio = Dio(
      options,

    );
    _dio!.interceptors.add(LoggingInterceptors());
    _dio!.interceptors.add(alice!.getDioInterceptor()); //displays logs in notification view
  }


  /// Method : POST
  /// Params : url, map for parameters
  Future<Response> post(String url, Map<String, dynamic> params) async {
    FormData body = FormData.fromMap(params);
    var response = await _dio!.post(url,
        data: body, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : PUT
  /// Params : url, map for parameters
  Future<Response> put(String url, Map<String, dynamic> params) async {
    _dio!.options.headers["Authorization"] = "";
    var response = await _dio!.put(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : DELETE
  /// Params : url, map for parameters
  Future<Response> delete(String url, Map<String, String> params) async {
    var response = await _dio!.delete(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }


  /// Method : GET
  /// Params : url
  Future<Response> getWithoutParams(String url) async {
    print("url");
    var response =
    await _dio!.get(url, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : GET
  /// Params : url, map for parameters
  Future<Response> getWithParam(
      String url, Map<String, dynamic> params) async {
    _dio!.options.headers["Authorization"] = ApiConstant.AUTHORIZED_KEY;
    var response = (await _dio?.get(url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json)))!;
    return response;
  }
}

/// Api Response codes
class ApiResponseCode {
  static const int SUCCESS_200            = 200;
  static const int SUCCESS_201            = 201;
  static const int ERROR_400              = 400;
  static const int ERROR_499              = 499;
  static const int ERROR_401              = 201;
  static const int ERROR_404              = 201;
  static const int ERROR_500              = 500;
  static const int INTERNET_UNAVAILABLE   = 999;
  static const int UNKNOWN                = 533;
}
