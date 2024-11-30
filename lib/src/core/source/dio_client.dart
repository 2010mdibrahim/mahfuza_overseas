import 'dart:core';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mahfuza_overseas/src/core/source/session_manager.dart';
import '../di/app_component.dart';
import '../network/configuration.dart';
import '../utilities/common_methods.dart';
import '../utilities/constants.dart';
import '../utilities/theme_config.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio);

  Future<Response?> post({
    required String path,
    dynamic request,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    dynamic header,
  }) async {
    Response? response;
    var connectivityResult = await (Connectivity().checkConnectivity());
    // try {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        response = await dio.post(
          (NetworkConfiguration.baseUrl) + path,
          data: request,
          // queryParameters: request,
          options: Options(
            method: "POST",
            receiveTimeout: const Duration(milliseconds: 30000),
          ),
        );
        print("response body ${response}");
    // var csrftoken = response.headers.remove('set-cookie').substring(10, 74);
        if (response.data != null) {
          logger.i("dio response $response");
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
      } else {
        CommonMethods.showToast(Constants.MESSAGE_NO_INTERNET, ThemeConfig.white);
      }
    // } catch (e) {
    //   // logger.d(e.toString());
    //   failureCallback("Something went wrong!", 400);
    // }
    return response;
  }

  Future<Response?> postMultiplatFormData({
    required String path,
    dynamic request,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    dynamic header,
  }) async {
    Response? response;
    var connectivityResult = await (Connectivity().checkConnectivity());
    try {

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        response = await dio.post(
          NetworkConfiguration.baseUrl + path,
          data: request,
          options: Options(
            headers: {
              "Content-Type":"application/json",
              "Accept":"*/*"
            },
            method: "POST",
            receiveTimeout: const Duration(milliseconds: 30000),
          ),
        );

        if (response.data != null) {
          logger.i("dio response $response");
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
      } else {
        CommonMethods.showToast(Constants.MESSAGE_NO_INTERNET, ThemeConfig.white);
      }
    } catch (e) {
      // logger.d(e.toString());
      failureCallback("Something went wrong!", 400);
    }
    return response;
  }

  // Future<Response?> postUpload({
  //   required String path,
  //   dynamic request,
  //   required Function(dynamic) responseCallback,
  //   required Function(String?, int?) failureCallback,
  //   dynamic header,
  // }) async {
  //   Response? response;
  //   var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  //   var formData = FormData.fromMap({
  //     'Image': '${request["Image"]}',
  //     'status': '${request["status"]}', //'101075',
  //     'Company': '${request["Company"]}',
  //     'DocumentType': '${request["DocumentType"]}'
  //   });
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try {
  //     if (connectivityResult == ConnectivityResult.mobile ||
  //         connectivityResult == ConnectivityResult.wifi) {
  //       response = await dio.post(
  //           'https://corporate3.bdjobs.com/api/v1/Uddokta/DocumentUpload.aspx',
  //           data: formData,
  //           options: Options(headers: headers));
  //
  //       if (response.data != null && response.statusCode == HttpStatus.ok ||
  //           response.statusCode == 200) {
  //         responseCallback(response.data);
  //       } else {
  //         failureCallback(response.statusMessage, response.statusCode);
  //       }
  //     } else if (connectivityResult == ConnectivityResult.none) {
  //       failureCallback(noInternetConnectionMessage, 12029);
  //     }
  //   } catch (e) {
  //     logger.e("Response code: ${response?.statusCode}");
  //     logger.e(e);
  //     failureCallback(tryAgainErrorMessage, 400);
  //   }
  //   return response;
  // }

  Future<Response?> get({
    required String path,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    Map<String, Object>? queryParameters, required bool isNeedToken,
  }) async {
    Response? response;
    var connectivityResult = await (Connectivity().checkConnectivity());
    try {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        response = await dio.get(
          NetworkConfiguration.baseUrl + path,
          queryParameters: queryParameters,
          options: Options(
            headers: isNeedToken == false ? {
              'Accept': '*'
            }: {
              'Accept': '*',
              // 'Authorization': 'Bearer ${session.getAccessToken}',
            },
            method: "GET",
            receiveTimeout: const Duration(milliseconds: 3000),
          ),
        );
        print("response.dataASDasdASDasds ${response}");
        if (response.data != null) {
          logger.i("dio response $response");
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        // failureCallback(noInternetConnectionMessage, 12029);
      }
    } on Exception catch (e, _) {
      // failureCallback(tryAgainErrorMessage, 400);
    }
    return response;
  }
}
