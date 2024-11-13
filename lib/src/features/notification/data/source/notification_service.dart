
import 'dart:convert';
import 'package:mahfuza_overseas/src/features/login_screen/data/model/login_model.dart';

import '../../../../../main.dart';
import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/source/dio_client.dart';
import '../../../../core/source/model/api_response.dart';
import '../../../../core/source/session_manager.dart';
import '../../../../core/utilities/constants.dart';
import '../model/notification_model.dart';
import 'package:dio/dio.dart' as dio;

class NotificationService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<NotificationModel>?> promotionPass() async {
    Response<NotificationModel>? apiResponse;

    dio.FormData formData = dio.FormData.fromMap({
      "access_token": "7a6b8847409097e23a493bd1affdd9e30b52dfe9abc9fd781086dd52c088d4d3",
      "api_type": "promotion_notification_data",
      "candidate_id": box.read("candidateId").toString()
    });
   await _dioClient.post(
      path: '',
      request: formData,
      responseCallback: (response, message) {
        var loginModel = NotificationModel.fromJson(response);
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

  Future<Response<ContactModel>?> updateNotificationSeenPass({String? updateNotificationId}) async {
    Response<ContactModel>? apiResponse;

    dio.FormData formData = dio.FormData.fromMap({
      "access_token": "7a6b8847409097e23a493bd1affdd9e30b52dfe9abc9fd781086dd52c088d4d3",
      "api_type": "promotion_notification_data",
      "candidate_id": box.read("candidateId").toString(),
      "update_notification_id": updateNotificationId,
    });
   await _dioClient.post(
      path: '',
      request: formData,
      responseCallback: (response, message) {
        var updateNotification = ContactModel.fromJson(response);
        // Create a Response object with the parsed data
        apiResponse = Response.success(updateNotification);
        logger.i("Login successful: $updateNotification");
      },
      failureCallback: (message, status) {
        apiResponse = Response.error(message, status);
      },
    );

    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }


}
