
import 'dart:convert';
import '../../../../../main.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/source/dio_client.dart';
import '../../../../core/source/model/api_response.dart';
import '../../../../core/source/session_manager.dart';
import '../../../../core/utilities/constants.dart';
import '../model/passport_process_model.dart';
import 'package:dio/dio.dart' as dio;

class PassportService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<PassportProcessStepModel>?> passportPass({String? candidateId}) async {
    Response<PassportProcessStepModel>? apiResponse;
    print("candidate Id service $candidateId");
    dio.FormData formData = dio.FormData.fromMap({
      "candidate_id": candidateId ?? box.read("candidateId").toString(),
      "access_token": "7a6b8847409097e23a493bd1affdd9e30b52dfe9abc9fd781086dd52c088d4d3",
      "api_type": "candidate_process_record",
    });
    for (final entry in formData.fields) {
      print('candidate id form data ${entry.key}: ${entry.value}');
    }
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
