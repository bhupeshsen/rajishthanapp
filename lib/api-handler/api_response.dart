import 'package:dio/dio.dart';


import 'package:get/get.dart' as getXProgressLoader;
import 'package:rajishthanapp/constant/string_constants.dart';


import 'api-handler.dart';
/// Wrapper class for Api Response
class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;
  ApiError? apiError;

  ApiResponse({this.status, this.data, this.apiError});

  /// loading
  static ApiResponse<T> loading<T>() {
    return ApiResponse<T>(status: ApiStatus.LOADING, data: null);
  }

  /// success
  static ApiResponse<T> success<T>(T data) {
    return ApiResponse<T>(status: ApiStatus.COMPLETED, data: data);
  }

  /// error
  static ApiResponse<T> error<T>({ int? errCode, String? errMsg,  T? errBdy, T? data}) {
    var apiError =
        ApiError(statusCode: errCode, errorMessage: errMsg, errorBody: errBdy);
    return ApiResponse<T>(
        status: ApiStatus.ERROR, apiError: apiError, data: data);
  }

  /// method wraps response in ApiResponse class
  static ApiResponse<T> returnResponse<T>(Response response, T apiResponse) {

    if (response.statusCode == ApiResponseCode.INTERNET_UNAVAILABLE) {
      getXProgressLoader.Get.back();
      return ApiResponse.error(
          errCode: response.statusCode,
          errMsg: StringConstants.NO_INTERNET_CONNECTION,
          data: null);
    } else if (response.statusCode == ApiResponseCode.SUCCESS_201 ||
        response.statusCode == ApiResponseCode.SUCCESS_200) {
      return ApiResponse.success(apiResponse);
    } else if (response.statusCode! >= ApiResponseCode.ERROR_400 &&
        response.statusCode! <= ApiResponseCode.ERROR_499) {
      getXProgressLoader.Get.back();
      return ApiResponse.error(
          errCode: response.statusCode,
          errMsg: response.statusMessage,
          errBdy: apiResponse,
          data: apiResponse);
    } else {
      getXProgressLoader.Get.back();
      return ApiResponse.error(
          errCode: ApiResponseCode.ERROR_500,
          errMsg: StringConstants.SOMETHING_WENT_WRONG,
          errBdy: apiResponse,
          data: null);
    }
  }


  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

/// Error class to store Api Error Response
class ApiError<T> {
  int? statusCode;
  String? errorMessage;
  T? errorBody;

  ApiError({this.statusCode, this.errorMessage, this.errorBody});
}
/// Enum to check Api Status
enum ApiStatus { LOADING, COMPLETED, ERROR }
