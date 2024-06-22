
import 'dart:convert';
import '../../../../core/di/app_component.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/source/dio_client.dart';
import '../../../../core/source/model/api_response.dart';
import '../../../../core/source/session_manager.dart';
import '../../../../core/utilities/constants.dart';
import '../model/passport_process_model.dart';
import 'package:dio/dio.dart' as dio;
var session = locator<SessionManager>();

class PassportService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<PassportProcessStepModel>?> passportPass() async {
    Response<PassportProcessStepModel>? apiResponse;

    dio.FormData formData = dio.FormData.fromMap({
      "candidate_id": session.getCandidateId,
      "access_token": "7a6b8847409097e23a493bd1affdd9e30b52dfe9abc9fd781086dd52c088d4d3",
      "api_type": "candidate_process_record",
    });
   await _dioClient.post(
      path: '',
      request: formData,
      responseCallback: (response, message) {
        var loginModel = PassportProcessStepModel.fromJson(response);
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
