import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' as getXProgressLoader;
import 'package:rajishthanapp/api-handler/api-handler.dart';
import 'package:rajishthanapp/constant/string_constants.dart';
import 'package:rajishthanapp/helper/util.dart';
import 'package:rajishthanapp/service-api-model/error_body.dart';

import 'api_response.dart';



extension ApiExtension on Future<Response<dynamic>> {

  Future execute<T>(Function(Map<String, dynamic>) model) async {
    try {

      final res = await this;
      return ApiResponse.returnResponse(res, res.data);
    } on Exception catch (error, stacktrace) {
      if (error is DioError) {

        dynamic errorResponse=error.response?.data;
        dynamic statusCode=error.response?.statusCode;


        try {

          var errResponse = ErrorBody.fromJson(error.response?.data);
          return ApiResponse.returnResponse(error.response!, errResponse);
        } catch (error) {

          return ApiResponse.error(
              errCode: ApiResponseCode.UNKNOWN,
              errMsg: statusCode!=null?errorResponse['message']:StringConstants.NO_INTERNET_CONNECTION,
              errBdy: StringConstants.SOMETHING_WENT_WRONG,
              data: null);
        }
      }
      return ApiResponse.error(
          errCode: ApiResponseCode.UNKNOWN,
          errMsg: error.toString(),
          errBdy: stacktrace.toString(),
          data: null);
    }
  }
}

extension ControllerResponseExtension on Future<dynamic> {
  Future getResponse<T>(Function(dynamic) responseData) async {
   //  showProgressBar();

    var response = await this as ApiResponse;
   //  getXProgressLoader.Get.back();
    if (response.data != null && response.status == ApiStatus.COMPLETED) {

      responseData(response);
    } else {


      var message = '';
      if (response.data != null) {
        message = response.data.detail;
      } else {
        message = response.apiError!.errorMessage!;
      }
     showSnackBar("Error Message ",message,Colors.black,false,"error");
    }

  }
}