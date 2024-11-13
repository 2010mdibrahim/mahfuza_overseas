
import 'dart:convert';
import 'package:mahfuza_overseas/src/features/login_screen/data/model/agent_model.dart';

import '../../../../core/di/app_component.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/source/dio_client.dart';
import '../../../../core/source/model/api_response.dart';
import '../../../../core/source/session_manager.dart';
import '../../../../core/utilities/constants.dart';
import '../model/login_model.dart';
import 'package:dio/dio.dart' as dio;

class SignInService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<LoginModel>?> loginWithIdPass(
      String id, String password) async {
    Response<LoginModel>? apiResponse;

    dio.FormData formData = dio.FormData.fromMap({
      "phone_number": id,
      "password": password,
      "access_token": "7a6b8847409097e23a493bd1affdd9e30b52dfe9abc9fd781086dd52c088d4d3",
      "api_type": "candidate_login_auth",
    });
    print("api response login form data ${id} $password");
    print("api response login form data ${formData}");
   await _dioClient.post(
      path: '',
      request: formData,
      responseCallback: (response, message) {
        var loginModel = LoginModel.fromJson(response);
        // Create a Response object with the parsed data
        apiResponse = Response.success(loginModel);
        logger.i("Login successful: $loginModel");
      },
      failureCallback: (message, status) {
        apiResponse = Response.error(message, status);
      },
    );


    logger.e("api response login ${apiResponse?.data?.type}");
    return apiResponse;
  }


  Future<Response<AgentBalanceModel>?> agentBalance(
      String id) async {
    Response<AgentBalanceModel>? apiResponse;

    dio.FormData formData = dio.FormData.fromMap({
      "agent_id": id,
      "access_token": "7a6b8847409097e23a493bd1affdd9e30b52dfe9abc9fd781086dd52c088d4d3",
      "api_type": "get_agent_balance",
    });
   await _dioClient.post(
      path: '',
      request: formData,
      responseCallback: (response, message) {
        var agentBalanceModel = AgentBalanceModel.fromJson(response);
        // Create a Response object with the parsed data
        apiResponse = Response.success(agentBalanceModel);
        logger.i("Login successful: $agentBalanceModel");
      },
      failureCallback: (message, status) {
        apiResponse = Response.error(message, status);
      },
    );


    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }


}
