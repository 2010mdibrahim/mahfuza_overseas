
import 'dart:convert';
import '../../../../core/di/app_component.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/source/dio_client.dart';
import '../../../../core/source/model/api_response.dart';
import '../../../../core/source/session_manager.dart';
import '../../../../core/utilities/constants.dart';
import '../model/login_model.dart';
import 'package:dio/dio.dart' as dio;
var session = locator<SessionManager>();

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


    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }


}
