
import 'dart:convert';
import 'package:mahfuza_overseas/src/features/login_screen/data/model/login_model.dart';

import '../../../../../main.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/source/dio_client.dart';
import '../../../../core/source/model/api_response.dart';
import '../../../../core/source/session_manager.dart';
import '../../../../core/utilities/constants.dart';
import '../model/candidate_service_info_model.dart';
import 'package:dio/dio.dart' as dio;

class CandidateServiceInfoService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<CandidateServiceInfoModel>?> candidateServiceInfoPass() async {
    Response<CandidateServiceInfoModel>? apiResponse;

    dio.FormData formData = dio.FormData.fromMap({
      "phone_number": box.read("phoneNumber").toString(),
      "access_token": "7a6b8847409097e23a493bd1affdd9e30b52dfe9abc9fd781086dd52c088d4d3",
      "api_type": "candidate_service_info",
    });
   await _dioClient.post(
      path: '',
      request: formData,
      responseCallback: (response, message) {
        var loginModel = CandidateServiceInfoModel.fromJson(response);
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
